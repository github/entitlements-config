# frozen_string_literal: true

require "json"
require "yaml"

PATH_TO_CHECK = ENV.fetch("ENTITLEMENTS_FILE_PATHS", ".txt") # only check txt files
EXCLUDED_FILES_ARRAY = File.readlines("config/manager_review_excluded.txt").map(&:chomp)
STRING_MATCH = "username"
OUTPUT_FILE = "managers.txt"
ORG_CHART = YAML.safe_load_file("config/orgchart.yaml")

# startup message
puts "========================================="
puts "🤖 manager_review"
puts "========================================="

# open the diff file and parse it as json
json_diff_file = File.read(ENV.fetch("DIFF", "diff.json"))
git_diff = JSON.parse(json_diff_file)

usernames = []

# loop through the files in the diff
git_diff["files"].each do |file|
  next if file["type"] == "DeletedFile" # Skip deleted files as they are not relevant

  path = file["path"] || file["pathAfter"]
  next unless path.end_with?(PATH_TO_CHECK) # Skip files that are not entitlments txt files

  # skip files that are in the excluded files array
  next if EXCLUDED_FILES_ARRAY.any? { |excluded_file| path.include?(excluded_file) }

  # loop through the chunks in the file
  file["chunks"].each do |chunk|
    # loop through the changes in the chunk
    chunk["changes"].each do |change|
      next if change["type"] == "DeletedLine" # skip deleted lines as they are not relevant

      next if change["type"] == "UnchangedLine" # skip unchanged lines as they are not relevant

      next unless change["content"].include?(STRING_MATCH)

      # fetch the username value from the line

      puts "👀 checking #{change['content']} for #{STRING_MATCH} value"

      # format the value of the username variable for processing
      username = change["content"].split(STRING_MATCH)[1].strip
      # remove any 'comments' from the value
      username = username.split("#")[0].strip
      # remove any in-line attributes from the value
      username = username.split(";")[0].strip # ie. username = value; expiration = "value"
      # remove any special characters from the value
      username = username.gsub(/["'= \[\],:]/, "")

      puts "💡 the value of #{STRING_MATCH} is #{username}"
      usernames << username
    end
  end
end

if usernames.empty?
  puts "no usernames found in diff"
  puts "📝 writting a bypass file"
  File.write(OUTPUT_FILE, "$NO_MANAGERS_FOUND$")
  puts "✅ wrote bypass file to #{OUTPUT_FILE}"
  exit(0)
end

# iterate over each username that is having access altered and fetch their manager
managers = usernames.map do |username|
  ORG_CHART[username]["manager"]
end

puts "💡 found #{managers.length} managers to request for review"
puts "📝 writting managers to #{OUTPUT_FILE}"
File.write(OUTPUT_FILE, managers.join(","))
puts "✅ wrote managers to #{OUTPUT_FILE}"
exit(0)
