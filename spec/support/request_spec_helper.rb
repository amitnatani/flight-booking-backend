# frozen_string_literal: true

module RequestSpecHelper
  # Parse JSON response to ruby hash
  def json
    body = JSON.parse(response.body)
    body.is_a?(Hash) ? body.with_indifferent_access : body
  end

  def strip_html(html_content)
    ActionView::Base.full_sanitizer.sanitize(html_content)
  end

  def expect_failure_response
    match_schema!('failure_response')
  end

  def match_schema!(schema)
    expect(response).to match_response_schema(schema)
  end

  def pson
    puts json.to_json
  end
end
