class PeopleController < ApplicationController
  def search
    @name = params[:name]
    search_people(@name)
  end

  private

  def search_people(name)
    result = audiosearch_client.search({ q: name }, 'people')
    @people = result.results
  end

  def audiosearch_client
    @audiosearch_client ||= Audiosearch::Client.new(
      id: ENV['AUDIOSEARCH_ID'],
      secret: ENV['AUDIOSEARCH_SECRET'],
      host: 'https://www.audiosear.ch/',
      debug: false,
    )
  end
end
