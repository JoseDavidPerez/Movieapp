//
//  Movieapi.swift
//  MoviesApp
//
//  Created by osx on 14/08/22.
//

import Foundation

enum MovieApiUrl : String {
    case newRequestToken = "authentication/token/new?api_key="
    case login = "authentication/token/validate_with_login?api_key="
    
    case getRakingShow = "trending/tv/week?api_key="
    case getTop = "tv/top_rated?api_key="
    case popular = "tv/popular?api_key="
    case airing = "tv/airing_today?api_key="
    case tv = "tv/on_the_air?api_key="
    
    
    func getUrl() -> String{
        return "\(MovieApi.baseApi)\(self.rawValue)\(MovieApi.apikey)"
    }
}

struct MovieApi {
    
    static var apikey = "6ceae38bfc242dcb89b35eacb1604ec9"
    static var baseApi = "https://api.themoviedb.org/3/"
    static var baseImg = "https://image.tmdb.org/t/p/w440_and_h660_face/"
    
    func login(request: LoginRequest, onSuccesed: @escaping(_ loginresponse: LoginResponse) -> Void,onError: @escaping(_ error: Error)-> Void) {
        ApiTask().request(.get, request: request) { data, session in
            do {
                let responde = try JSONDecoder().decode(LoginResponse.self, from: data)
                onSuccesed(responde)
            } catch {
                onError(ApiError.failedParse)
            }
        } onError: { error in
            onError(error)
        }

    }
    
    
    func newRequestToken(request: NewRequestTokenRequest, onSuccesed: @escaping(_ loginresponse: NewRequestToken) -> Void,onError: @escaping(_ error: Error)-> Void) {
        ApiTask().request(.get, request: request) { data, session in
            do {
                let responde = try JSONDecoder().decode(NewRequestToken.self, from: data)
                onSuccesed(responde)
            } catch {
                onError(ApiError.failedParse)
            }
        } onError: { error in
            onError(error)
        }

    }
    
    func getRakingShow(request: Request, onSuccesed: @escaping(_ response: MoviesResponse) -> Void,onError: @escaping(_ error: Error)-> Void) {
        ApiTask().request(.get, request: request) { data, session in
            do {
                let responde = try JSONDecoder().decode(MoviesResponse.self, from: data)
                onSuccesed(responde)
            } catch {
                onError(ApiError.failedParse)
            }
        } onError: { error in
            onError(error)
        }

    }
    
    func getMovies(request: Request, onSuccesed: @escaping(_ response: MoviesResponse) -> Void,onError: @escaping(_ error: Error)-> Void) {
        ApiTask().request(.get, request: request) { data, session in
            do {
                let responde = try JSONDecoder().decode(MoviesResponse.self, from: data)
                onSuccesed(responde)
            } catch {
                onError(ApiError.failedParse)
            }
        } onError: { error in
            onError(error)
        }

    }

    
}
