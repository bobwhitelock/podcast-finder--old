class PeopleController < ApplicationController
  def search
    @name = params[:name]
    search_episodes(@name)
  end

  private

  def search_episodes(name)
    result = audiosearch_client.search({ q: name, from: 0, size: 50 }, 'episodes')
    @episodes = result.results.map { |e| parse_episode_result(e) }
  end

  def parse_episode_result(episode_result)
    OpenStruct.new({
      player_url: episode_result.urls.ui,
      image_url: episode_result.image_urls.full,
      show_title: episode_result.show_title,
      date: episode_result.date_created,
      title: episode_result.title,
    })
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
