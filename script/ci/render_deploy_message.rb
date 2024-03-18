# frozen_string_literal: true
require "erb"

# load the output file
input_file_path = ENV.fetch("INPUT_FILE_PATH", "deploy.out")
puts "reading deployment output from: #{input_file_path}"
results = File.read(input_file_path)

# if the very last line is a newline, remove it
results = results.chomp

erb_template = ENV.fetch("TEMPLATE", ".github/deployment_message.md")
template = ERB.new(File.read(erb_template))
# render the ERB template with binding on <%= results %> to replace it with the results
erb_template_rendered = template.result(binding)

template_save_path = ENV.fetch("TEMPLATE_SAVE_PATH", erb_template)
puts "saving the rendered ERB template to: #{template_save_path}"

File.open(template_save_path, "w") { |file| file.write(erb_template_rendered) }
