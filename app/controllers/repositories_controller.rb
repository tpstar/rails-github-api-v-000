class RepositoriesController < ApplicationController
  def index
    repo_data = Faraday.get("https://api.github.com/user/repos",
                            {},
                            {'Authorization' => "token #{session[:token]}",
                             'Accept' => 'application/json'})
    @repos = JSON.parse(repo_data.body)
    # raise @repos.inspect
  end

  def create

    response = Faraday.post("https://api.github.com/user/repos",
                            {name: params[:name]}.to_json,
                            {'Authorization' => "token #{session[:token]}", 'Accept' => 'application/json'})
    redirect_to root_path
  end
end
