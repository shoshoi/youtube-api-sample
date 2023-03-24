def timecheck(str)
  /^[0-9]{1,2}(:[0-9]{1,2})+?.*$/ =~ str
end

require 'google/apis/youtube_v3'

youtube = Google::Apis::YoutubeV3::YouTubeService.new
youtube.key = "キーを入力"

options = {
  :channelId => 'UCMx7SHy9rpEK0v7sMMJk1BQ', #YouTubeチャンネルのIDを指定
  :order => "date"
}

res = nil
begin
  if res == nil 
    res = youtube.list_playlist_items(
      'snippet',
      playlist_id: "PLBVmEsj9KFue0oPzmzrhrhB91aHejWqLG",
      #max_results: 50
    )
  else
    res = youtube.list_playlist_items(
      'snippet',
      playlist_id: "PLBVmEsj9KFue0oPzmzrhrhB91aHejWqLG",
      page_token: res.next_page_token
    )
  end
  res.items.each do |item|
    item.snippet.description.split("\n").each do |line|
      if timecheck(line)
        puts line
      end
    end
  end
  sleep(1)
end while(!res != nil && res.next_page_token != nil)
