using HTTP
using JSON
using DataFrames

url = "http://ws.audioscrobbler.com/2.0"
API_KEY = "d64689be7e41bc67da1b23a7adfe854a"
USER_AGENT = "danmarvi"

while true
        headers = Dict("user-agent" => USER_AGENT)
        params = Dict("api_key" => API_KEY,
                "user" => "danmarvi",
                "limit" => 5,
                "method" => "user.getrecenttracks",
                "format" => "json")

        response = HTTP.get(url,
                        headers=headers, 
                        query=params)

        
        data = JSON.parse(String(response.body))
        
        tracks = data["recenttracks"]["track"]
        print(data["recenttracks"]["@attr"])
        

        # for track in tracks
        #         #print(track)
        #         print()
        # end
        
        break
end



