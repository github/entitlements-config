### Deployment Results {{ ":white_check_mark:" if status === "success" else ":x:" }}

{% if status === "success" %} **{{ actor }}** successfully **{{ "noop" if noop else "branch" }}** deployed branch `{{ ref }}` to **{{ environment }}**{% endif %}

{% if status === "failure" %} **{{ actor }}** your **{{ "noop" if noop else "branch" }}** deployment of `{{ ref }}` failed to deploy to the **{{ environment }}** environment{% endif %}

{% if status === "unknown" %} **{{ actor }}** your **{{ "noop" if noop else "branch" }}** deployment of `{{ ref }}` is in an unknown state when trying to deploy to the **{{ environment }}** environment.{% endif %}

<details><summary>Show Results</summary>

```text
<%= results %>
```

</details>
