# frozen_string_literal: true

module ApplicationHelper
  def this_year
    Time.now.year
  end

  def github_url(author, repo)
    link_to 'TestGuru', "https://github.com/#{author}/#{repo}"
  end
end
