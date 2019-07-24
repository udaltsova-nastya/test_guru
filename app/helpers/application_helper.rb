# frozen_string_literal: true

# :nodoc:
module ApplicationHelper
  def current_year
    # Do not use Date.today without zone. Use Time.zone.today instead
    Time.zone.today.year
  end

  def github_url(author, repo)
    link_to repo, "https://github.com/#{author}/#{repo}"
  end
end
