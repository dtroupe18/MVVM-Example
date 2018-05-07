//
//  iTunesAPI.swift
//  MVVM Example
//
//  Created by Dave on 5/6/18.
//  Copyright © 2018 High Tree Development. All rights reserved.
//

import Foundation

class iTunesAPI {
    
    static func fetchTop100Apps(completion: @escaping ([Result]?) ->()) {
        print("fetch called")
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/100/explicit.json") else {
            print("Error creating URL")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            guard let unwrappedData = data else { print("Error getting data"); return }
            
            do {
                let welcome = try JSONDecoder().decode(Welcome.self, from: unwrappedData)
                completion(welcome.feed.results)
            } catch {
                completion(nil)
                print("Error getting data from API: \(error.localizedDescription)")
                print("error: \(error)")
            }
        }
        dataTask.resume()
    }
    
    static func fetchTop25Apps(completion: @escaping ([App]?) ->()) {
        guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json") else {
            print("Error creating URL")
            return
        }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            if let data = data { 
                do {
                    let welcome = try JSONDecoder().decode(Welcome.self, from: data)
                    completion(welcome.feed.results)
                } catch {
                    completion(nil)
                    print("Error getting data from API: \(error.localizedDescription)")
                    print("error: \(error)")
                }
            } else {
                print("Error getting data")
                completion(nil)
            }
        }
        dataTask.resume()
    }
}





// Sample Response
/*

{
    "feed":{
        "title":"Top Free iPhone Apps",
        "id":"https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json",
        "author":{
            "name":"iTunes Store",
            "uri":"http://wwww.apple.com/us/itunes/"
        },
        "links":[
        {
        "self":"https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/25/explicit.json"
        },
        {
        "alternate":"https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop?genreId=36\u0026popId=27"
        }
        ],
        "copyright":"Copyright © 2018 Apple Inc. All rights reserved.",
        "country":"us",
        "icon":"http://itunes.apple.com/favicon.ico",
        "updated":"2018-05-06T01:54:20.000-07:00",
        
        "results":[
        {
        "artistName":"Serkan Ozyilmaz",
        "id":"1354452189",
        "releaseDate":"2018-03-20",
        "name":"Rise Up",
        "kind":"iosSoftware",
        "copyright":"© Serkan Ozyilmaz",
        "artistId":"1354452188",
        "artistUrl":"https://itunes.apple.com/us/developer/serkan-ozyilmaz/id1354452188?mt=8",
        "artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/37/0a/af/370aaf0b-2f32-8355-b4a2-0e2508ba617b/AppIcon-1x_U007emarketing-85-220-8.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6014",
        "name":"Games",
        "url":"https://itunes.apple.com/us/genre/id6014"
        },
        {
        "genreId":"7003",
        "name":"Arcade",
        "url":"https://itunes.apple.com/us/genre/id7003"
        },
        {
        "genreId":"7002",
        "name":"Adventure",
        "url":"https://itunes.apple.com/us/genre/id7002"
        }
        ],
        "url":"https://itunes.apple.com/us/app/rise-up/id1354452189?mt=8"
        },
        {
        "artistName":"Super Tapx",
        "id":"1348173937",
        "releaseDate":"2018-02-14",
        "name":"Love Balls",
        "kind":"iosSoftware",
        "copyright":"© Super Tapx",
        "artistId":"843142961",
        "artistUrl":"https://itunes.apple.com/us/developer/super-tapx/id843142961?mt=8",
        "artworkUrl100":"https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/f8/5d/df/f85ddf6e-53ec-e3d6-f530-bc7726116726/AppIcon-1x_U007emarketing-85-220-8.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6014",
        "name":"Games",
        "url":"https://itunes.apple.com/us/genre/id6014"
        },
        {
        "genreId":"7012",
        "name":"Puzzle",
        "url":"https://itunes.apple.com/us/genre/id7012"
        },
        {
        "genreId":"6016",
        "name":"Entertainment",
        "url":"https://itunes.apple.com/us/genre/id6016"
        },
        {
        "genreId":"7004",
        "name":"Board",
        "url":"https://itunes.apple.com/us/genre/id7004"
        }
        ],
        "url":"https://itunes.apple.com/us/app/love-balls/id1348173937?mt=8"
        },
        {
        "artistName":"Voodoo",
        "id":"1345968745",
        "releaseDate":"2018-02-10",
        "name":"Helix Jump",
        "kind":"iosSoftware",
        "copyright":"© h8games",
        "artistId":"714804730",
        "artistUrl":"https://itunes.apple.com/us/developer/voodoo/id714804730?mt=8",
        "artworkUrl100":"https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/72/2b/d7/722bd7a0-6e5c-ca30-6f5e-28a2db857fc4/AppIcon-1x_U007emarketing-0-85-220-0-8.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6014",
        "name":"Games",
        "url":"https://itunes.apple.com/us/genre/id6014"
        },
        {
        "genreId":"7001",
        "name":"Action",
        "url":"https://itunes.apple.com/us/genre/id7001"
        },
        {
        "genreId":"7003",
        "name":"Arcade",
        "url":"https://itunes.apple.com/us/genre/id7003"
        }
        ],
        "url":"https://itunes.apple.com/us/app/helix-jump/id1345968745?mt=8"
        },
        {
        "artistName":"Epic Games",
        "id":"1261357853",
        "releaseDate":"2018-03-15",
        "name":"Fortnite",
        "kind":"iosSoftware",
        "copyright":"Fortnite © 2018 Epic Games, Inc. Epic, Epic Games, Unreal, Unreal Engine, and Fortnite are registered trademarks of Epic Games, Inc. in the USA (Reg. U.S. Pat. \u0026 Tm. Off.) and elsewhere.",
        "artistId":"387428403",
        "artistUrl":"https://itunes.apple.com/us/developer/epic-games/id387428403?mt=8",
        "artworkUrl100":"https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/68/8c/d0/688cd065-4193-b60e-940d-1a1aed03944e/AppIcon-1x_U007emarketing-85-220-0-6.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6014",
        "name":"Games",
        "url":"https://itunes.apple.com/us/genre/id6014"
        },
        {
        "genreId":"6016",
        "name":"Entertainment",
        "url":"https://itunes.apple.com/us/genre/id6016"
        },
        {
        "genreId":"7001",
        "name":"Action",
        "url":"https://itunes.apple.com/us/genre/id7001"
        },
        {
        "genreId":"7002",
        "name":"Adventure",
        "url":"https://itunes.apple.com/us/genre/id7002"
        }
        ],
        "url":"https://itunes.apple.com/us/app/fortnite/id1261357853?mt=8"
        },
        {
        "artistName":"Google, Inc.",
        "id":"544007664",
        "releaseDate":"2012-09-11",
        "name":"YouTube: Watch, Listen, Stream",
        "kind":"iosSoftware",
        "copyright":"© 2017 Google Inc.",
        "artistId":"281956209",
        "artistUrl":"https://itunes.apple.com/us/developer/google-inc/id281956209?mt=8",
        "artworkUrl100":"https://is2-ssl.mzstatic.com/image/thumb/Purple118/v4/a8/e0/35/a8e03505-34af-db4c-7007-358197c296b8/AppIcon-1x_U007emarketing-85-220-0-6.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6008",
        "name":"Photo \u0026 Video",
        "url":"https://itunes.apple.com/us/genre/id6008"
        },
        {
        "genreId":"6016",
        "name":"Entertainment",
        "url":"https://itunes.apple.com/us/genre/id6016"
        }
        ],
        "url":"https://itunes.apple.com/us/app/youtube-watch-listen-stream/id544007664?mt=8"
        },
        {
        "artistName":"Google, Inc.",
        "id":"585027354",
        "releaseDate":"2012-12-13",
        "name":"Google Maps - GPS Navigation",
        "kind":"iosSoftware",
        "copyright":"© Google Inc.",
        "artistId":"281956209",
        "artistUrl":"https://itunes.apple.com/us/developer/google-inc/id281956209?mt=8",
        "artworkUrl100":"https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/88/8f/56/888f56bc-86c0-2c86-14c8-76ae50b9fa5f/logo_maps_ios_color-1x_U007emarketing-85-220-0-5.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6010",
        "name":"Navigation",
        "url":"https://itunes.apple.com/us/genre/id6010"
        },
        {
        "genreId":"6023",
        "name":"Food \u0026 Drink",
        "url":"https://itunes.apple.com/us/genre/id6023"
        }
        ],
        "url":"https://itunes.apple.com/us/app/google-maps-gps-navigation/id585027354?mt=8"
        },
        {
        "artistName":"Instagram, Inc.",
        "id":"389801252",
        "releaseDate":"2010-10-06",
        "name":"Instagram",
        "kind":"iosSoftware",
        "copyright":"© 2015 Instagram, LLC.",
        "artistId":"389801255",
        "artistUrl":"https://itunes.apple.com/us/developer/instagram-inc/id389801255?mt=8",
        "artworkUrl100":"https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/d1/a3/4b/d1a34ba6-4107-4ba6-74b8-f5308dab2096/Prod-1x_U007emarketing-85-220-0-5.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6008",
        "name":"Photo \u0026 Video",
        "url":"https://itunes.apple.com/us/genre/id6008"
        },
        {
        "genreId":"6005",
        "name":"Social Networking",
        "url":"https://itunes.apple.com/us/genre/id6005"
        }
        ],
        "url":"https://itunes.apple.com/us/app/instagram/id389801252?mt=8"
        },
        {
        "artistName":"Snap, Inc.",
        "id":"447188370",
        "releaseDate":"2011-07-13",
        "name":"Snapchat",
        "kind":"iosSoftware",
        "copyright":"© Snap Inc.",
        "artistId":"446889612",
        "artistUrl":"https://itunes.apple.com/us/developer/snap-inc/id446889612?mt=8",
        "artworkUrl100":"https://is5-ssl.mzstatic.com/image/thumb/Purple118/v4/30/30/07/303007dc-b078-24e1-35cd-d9e175effaaf/AppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-4.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6008",
        "name":"Photo \u0026 Video",
        "url":"https://itunes.apple.com/us/genre/id6008"
        },
        {
        "genreId":"6005",
        "name":"Social Networking",
        "url":"https://itunes.apple.com/us/genre/id6005"
        }
        ],
        "url":"https://itunes.apple.com/us/app/snapchat/id447188370?mt=8"
        },
        {
        "artistName":"Facebook, Inc.",
        "id":"454638411",
        "releaseDate":"2011-08-09",
        "name":"Messenger",
        "kind":"iosSoftware",
        "copyright":"© Facebook, Inc.",
        "artistId":"284882218",
        "artistUrl":"https://itunes.apple.com/us/developer/facebook-inc/id284882218?mt=8",
        "artworkUrl100":"https://is3-ssl.mzstatic.com/image/thumb/Purple128/v4/f9/7f/1d/f97f1db2-70ff-656e-caca-c6e95cae755c/Icon-Production-1x_U007emarketing-85-220-6.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6005",
        "name":"Social Networking",
        "url":"https://itunes.apple.com/us/genre/id6005"
        },
        {
        "genreId":"6007",
        "name":"Productivity",
        "url":"https://itunes.apple.com/us/genre/id6007"
        }
        ],
        "url":"https://itunes.apple.com/us/app/messenger/id454638411?mt=8"
        },
        {
        "artistName":"Facebook, Inc.",
        "id":"284882215",
        "releaseDate":"2008-07-11",
        "name":"Facebook",
        "kind":"iosSoftware",
        "copyright":"© Facebook, Inc.",
        "artistId":"284882218",
        "artistUrl":"https://itunes.apple.com/us/developer/facebook-inc/id284882218?mt=8",
        "artworkUrl100":"https://is2-ssl.mzstatic.com/image/thumb/Purple125/v4/01/cb/24/01cb24a4-921d-b1ab-5778-5c2b9c99e4b9/Icon-Production-1x_U007emarketing-85-220-6.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6005",
        "name":"Social Networking",
        "url":"https://itunes.apple.com/us/genre/id6005"
        }
        ],
        "url":"https://itunes.apple.com/us/app/facebook/id284882215?mt=8"
        },
        {
        "artistName":"Jam City, Inc.",
        "id":"1333256716",
        "releaseDate":"2018-04-25",
        "name":"Harry Potter: Hogwarts Mystery",
        "kind":"iosSoftware",
        "copyright":"© Jam City",
        "artistId":"290671617",
        "artistUrl":"https://itunes.apple.com/us/developer/jam-city-inc/id290671617?mt=8",
        "artworkUrl100":"https://is2-ssl.mzstatic.com/image/thumb/Purple118/v4/e2/3d/79/e23d7941-7801-3d10-8f92-1774d32c49b6/mzl.ybbpsunh.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6014",
        "name":"Games",
        "url":"https://itunes.apple.com/us/genre/id6014"
        },
        {
        "genreId":"7002",
        "name":"Adventure",
        "url":"https://itunes.apple.com/us/genre/id7002"
        }
        ],
        "url":"https://itunes.apple.com/us/app/harry-potter-hogwarts-mystery/id1333256716?mt=8"
        },
        {
        "artistName":"Bitstrips",
        "id":"868077558",
        "releaseDate":"2014-10-29",
        "name":"Bitmoji",
        "kind":"iosSoftware",
        "copyright":"© Bitstrips Inc.",
        "artistId":"694701217",
        "artistUrl":"https://itunes.apple.com/us/developer/bitstrips/id694701217?mt=8",
        "artworkUrl100":"https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/92/3a/89/923a89ce-45a9-3481-a1bd-8d2acf9d36f7/AppIcon-1x_U007emarketing-85-220-0-4.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6002",
        "name":"Utilities",
        "url":"https://itunes.apple.com/us/genre/id6002"
        },
        {
        "genreId":"6016",
        "name":"Entertainment",
        "url":"https://itunes.apple.com/us/genre/id6016"
        }
        ],
        "url":"https://itunes.apple.com/us/app/bitmoji/id868077558?mt=8"
        },
        {
        "artistName":"Spotify Ltd.",
        "id":"324684580",
        "releaseDate":"2011-07-14",
        "name":"Spotify Music",
        "kind":"iosSoftware",
        "copyright":"© 2008–2017 Spotify Ltd.",
        "artistId":"324684583",
        "artistUrl":"https://itunes.apple.com/us/developer/spotify-ltd/id324684583?mt=8",
        "artworkUrl100":"https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/77/e6/95/77e6955f-6d4a-67a1-31df-11ead5fe9acb/AppIcon-1x_U007emarketing-85-220-0-5.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6011",
        "name":"Music",
        "url":"https://itunes.apple.com/us/genre/id6011"
        },
        {
        "genreId":"6016",
        "name":"Entertainment",
        "url":"https://itunes.apple.com/us/genre/id6016"
        }
        ],
        "url":"https://itunes.apple.com/us/app/spotify-music/id324684580?mt=8"
        },
        {
        "artistName":"Uber Technologies, Inc.",
        "id":"368677368",
        "releaseDate":"2010-05-21",
        "name":"Uber",
        "kind":"iosSoftware",
        "copyright":"© Uber Technologies Inc.",
        "artistId":"368677371",
        "artistUrl":"https://itunes.apple.com/us/developer/uber-technologies-inc/id368677371?mt=8",
        "artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/51/e9/f0/51e9f06f-5267-306b-066a-8ef23d60859d/AppIcon-1x_U007emarketing-85-220-0-6.jpeg/200x200bb.png",
        "genres":[
        {
        "genreId":"6003",
        "name":"Travel",
        "url":"https://itunes.apple.com/us/genre/id6003"
        },
        {
        "genreId":"6012",
        "name":"Lifestyle",
        "url":"https://itunes.apple.com/us/genre/id6012"
        }
        ],
        "url":"https://itunes.apple.com/us/app/uber/id368677368?mt=8"
        },
        {
        "artistName":"Dennis Vukanovic",
        "id":"1323957120",
        "releaseDate":"2017-12-12",
        "name":"Granny",
        "kind":"iosSoftware",
        "copyright":"© 2018, DVloper.",
        "artistId":"954916186",
        "artistUrl":"https://itunes.apple.com/us/developer/dennis-vukanovic/id954916186?mt=8",
        "artworkUrl100":"https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/53/4d/9a/534d9acd-fb64-d274-d240-7e96db76c566/pr_source.jpg/200x200bb.png",
        "genres":[
        {
        "genreId":"6014",
        "name":"Games",
        "url":"https://itunes.apple.com/us/genre/id6014"
        },
        {
        "genreId":"7003",
        "name":"Arcade",
        "url":"https://itunes.apple.com/us/genre/id7003"
        }
        ],
        "url":"https://itunes.apple.com/us/app/granny/id1323957120?mt=8"
        },
        {
        "artistName":"Netflix, Inc.",
        "id":"363590051",
        "releaseDate":"2010-04-01",
        "name":"Netflix",
        "kind":"iosSoftware",
        "copyright":"© 2016 Netflix, Inc.",
        "artistId":"363590054",
        "artistUrl":"https://itunes.apple.com/us/developer/netflix-inc/id363590054?mt=8",
        "artworkUrl100":"https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/50/2d/a9/502da9a3-f6e1-dba9-3dc0-c8825ab314bf/AppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-9.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6016",
        "name":"Entertainment",
        "url":"https://itunes.apple.com/us/genre/id6016"
        },
        {
        "genreId":"6012",
        "name":"Lifestyle",
        "url":"https://itunes.apple.com/us/genre/id6012"
        }
        ],
        "url":"https://itunes.apple.com/us/app/netflix/id363590051?mt=8"
        },
        {
        "artistName":"Google, Inc.",
        "id":"422689480",
        "releaseDate":"2011-11-02",
        "name":"Gmail - Email by Google",
        "kind":"iosSoftware",
        "copyright":"© Google LLC",
        "artistId":"281956209",
        "artistUrl":"https://itunes.apple.com/us/developer/google-inc/id281956209?mt=8",
        "artworkUrl100":"https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/00/d6/81/00d68187-41f7-e4a7-de60-5adccdef8373/logo_gmail_color-1x_U007emarketing-85-220-0-5.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6007",
        "name":"Productivity",
        "url":"https://itunes.apple.com/us/genre/id6007"
        },
        {
        "genreId":"6005",
        "name":"Social Networking",
        "url":"https://itunes.apple.com/us/genre/id6005"
        }
        ],
        "url":"https://itunes.apple.com/us/app/gmail-email-by-google/id422689480?mt=8"
        },
        {
        "artistName":"Tencent Mobile International Limited",
        "id":"1330123889",
        "releaseDate":"2018-03-19",
        "name":"PUBG MOBILE",
        "kind":"iosSoftware",
        "copyright":"© Shenzhen Tencent Computer Systems Comany Limited",
        "artistId":"504515421",
        "artistUrl":"https://itunes.apple.com/us/developer/tencent-mobile-international-limited/id504515421?mt=8",
        "artworkUrl100":"https://is3-ssl.mzstatic.com/image/thumb/Purple118/v4/50/f9/ee/50f9ee6e-8dcc-38a1-3039-36de1509a124/AppIcon-1x_U007emarketing-85-220-0-6.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6014",
        "name":"Games",
        "url":"https://itunes.apple.com/us/genre/id6014"
        },
        {
        "genreId":"7001",
        "name":"Action",
        "url":"https://itunes.apple.com/us/genre/id7001"
        },
        {
        "genreId":"7017",
        "name":"Strategy",
        "url":"https://itunes.apple.com/us/genre/id7017"
        }
        ],
        "url":"https://itunes.apple.com/us/app/pubg-mobile/id1330123889?mt=8"
        },
        {
        "artistName":"Pandora Media, Inc.",
        "id":"284035177",
        "releaseDate":"2008-07-11",
        "name":"Pandora Music",
        "kind":"iosSoftware",
        "copyright":"© 2017 Pandora Media, Inc.",
        "artistId":"284035180",
        "artistUrl":"https://itunes.apple.com/us/developer/pandora-media-inc/id284035180?mt=8",
        "artworkUrl100":"https://is4-ssl.mzstatic.com/image/thumb/Purple128/v4/c3/17/39/c3173996-3ee5-ba18-34f6-cabfc32426bb/AppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-6.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6011",
        "name":"Music",
        "url":"https://itunes.apple.com/us/genre/id6011"
        }
        ],
        "url":"https://itunes.apple.com/us/app/pandora-music/id284035177?mt=8"
        },
        {
        "artistName":"WhatsApp Inc.",
        "id":"310633997",
        "releaseDate":"2009-05-04",
        "name":"WhatsApp Messenger",
        "kind":"iosSoftware",
        "copyright":"© 2018 WhatsApp Inc.",
        "artistId":"310634000",
        "artistUrl":"https://itunes.apple.com/us/developer/whatsapp-inc/id310634000?mt=8",
        "artworkUrl100":"https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/7c/19/0d/7c190de7-f52d-25f4-f150-9e88514565f4/AppIcon-1x_U007emarketing-0-85-220-0-3.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6005",
        "name":"Social Networking",
        "url":"https://itunes.apple.com/us/genre/id6005"
        },
        {
        "genreId":"6002",
        "name":"Utilities",
        "url":"https://itunes.apple.com/us/genre/id6002"
        }
        ],
        "url":"https://itunes.apple.com/us/app/whatsapp-messenger/id310633997?mt=8"
        },
        {
        "artistName":"Lion Studios",
        "id":"1247895794",
        "releaseDate":"2017-07-09",
        "name":"Weave the Line",
        "kind":"iosSoftware",
        "copyright":"© Lion Studios LLC",
        "artistId":"1362220666",
        "artistUrl":"https://itunes.apple.com/us/developer/lion-studios/id1362220666?mt=8",
        "artworkUrl100":"https://is4-ssl.mzstatic.com/image/thumb/Purple118/v4/ab/48/16/ab48167b-5e03-7f77-ef7b-39d67b316e6f/AppIcon-1x_U007emarketing-85-220-9.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6014",
        "name":"Games",
        "url":"https://itunes.apple.com/us/genre/id6014"
        },
        {
        "genreId":"7012",
        "name":"Puzzle",
        "url":"https://itunes.apple.com/us/genre/id7012"
        },
        {
        "genreId":"7004",
        "name":"Board",
        "url":"https://itunes.apple.com/us/genre/id7004"
        }
        ],
        "url":"https://itunes.apple.com/us/app/weave-the-line/id1247895794?mt=8"
        },
        {
        "artistName":"Voodoo",
        "id":"1340860865",
        "releaseDate":"2018-01-31",
        "name":"Sky Rusher",
        "kind":"iosSoftware",
        "copyright":"© Voodoo 2018",
        "artistId":"714804730",
        "artistUrl":"https://itunes.apple.com/us/developer/voodoo/id714804730?mt=8",
        "artworkUrl100":"https://is3-ssl.mzstatic.com/image/thumb/Purple125/v4/42/14/12/421412a4-1ee3-3944-2a24-27c6da3662c5/AppIcon-1x_U007emarketing-0-85-220-0-8.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6014",
        "name":"Games",
        "url":"https://itunes.apple.com/us/genre/id6014"
        }
        ],
        "url":"https://itunes.apple.com/us/app/sky-rusher/id1340860865?mt=8"
        },
        {
        "artistName":"Voodoo",
        "id":"1233739175",
        "releaseDate":"2017-05-16",
        "name":"Snake VS Block",
        "kind":"iosSoftware",
        "copyright":"© bento 2017",
        "artistId":"714804730",
        "artistUrl":"https://itunes.apple.com/us/developer/voodoo/id714804730?mt=8",
        "artworkUrl100":"https://is1-ssl.mzstatic.com/image/thumb/Purple118/v4/22/c5/f0/22c5f008-f977-f8e1-43e1-8d0c807b98ac/AppIcon-1x_U007emarketing-0-85-220-0-8.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6014",
        "name":"Games",
        "url":"https://itunes.apple.com/us/genre/id6014"
        },
        {
        "genreId":"6016",
        "name":"Entertainment",
        "url":"https://itunes.apple.com/us/genre/id6016"
        },
        {
        "genreId":"7001",
        "name":"Action",
        "url":"https://itunes.apple.com/us/genre/id7001"
        },
        {
        "genreId":"7003",
        "name":"Arcade",
        "url":"https://itunes.apple.com/us/genre/id7003"
        }
        ],
        "url":"https://itunes.apple.com/us/app/snake-vs-block/id1233739175?mt=8"
        },
        {
        "artistName":"AMZN Mobile LLC",
        "id":"297606951",
        "releaseDate":"2008-12-03",
        "name":"Amazon - Shopping made easy",
        "kind":"iosSoftware",
        "copyright":"© 2018 AMZN Mobile LLC",
        "artistId":"297606954",
        "artistUrl":"https://itunes.apple.com/us/developer/amzn-mobile-llc/id297606954?mt=8",
        "artworkUrl100":"https://is2-ssl.mzstatic.com/image/thumb/Purple128/v4/8e/a3/1d/8ea31dad-a799-5b6f-848f-453e2ef4f706/AppIcon-1x_U007emarketing-85-220-0-5.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6024",
        "name":"Shopping",
        "url":"https://itunes.apple.com/us/genre/id6024"
        },
        {
        "genreId":"6012",
        "name":"Lifestyle",
        "url":"https://itunes.apple.com/us/genre/id6012"
        }
        ],
        "url":"https://itunes.apple.com/us/app/amazon-shopping-made-easy/id297606951?mt=8"
        },
        {
        "artistName":"Square, Inc.",
        "id":"711923939",
        "releaseDate":"2013-10-16",
        "name":"Cash App",
        "kind":"iosSoftware",
        "copyright":"© 2013–2018 Square, Inc.",
        "artistId":"335393791",
        "artistUrl":"https://itunes.apple.com/us/developer/square-inc/id335393791?mt=8",
        "artworkUrl100":"https://is5-ssl.mzstatic.com/image/thumb/Purple128/v4/47/b4/88/47b488c7-7e9f-3935-1d04-dcebf539b250/AppIcon-1x_U007emarketing-0-0-GLES2_U002c0-512MB-sRGB-0-0-0-85-220-0-0-0-4.png/200x200bb.png",
        "genres":[
        {
        "genreId":"6015",
        "name":"Finance",
        "url":"https://itunes.apple.com/us/genre/id6015"
        },
        {
        "genreId":"6000",
        "name":"Business",
        "url":"https://itunes.apple.com/us/genre/id6000"
        }
        ],
        "url":"https://itunes.apple.com/us/app/cash-app/id711923939?mt=8"
        }
        ]
    }
}
*/
























