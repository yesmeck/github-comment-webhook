require 'rubygems'
require 'sinatra'
require 'octokit'

client = Octokit::Client.new(:access_token => ENV["GITHUB_TOKEN"])

get '/' do
  '<a href="https://github.com/yesmeck/github-comment-webhook">https://github.com/yesmeck/github-comment-webhook</a>'
end


post '/' do
  body = <<~EOF
    Site Preview: #{params['url']}
  EOF
  comment = client.add_comment(ENV["GITHUB_REPO"], params['id'], body)
  comment[:id]
end
