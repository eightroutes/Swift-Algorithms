//
//  베스트앨범.swift
//  Algorithms
//
//  Created by 정근호 on 4/7/25.
//

import Foundation

//func bestAlbum(_ genres: [String], _ plays: [Int]) -> [Int] {
//    // 장르별 총 재생 횟수와 노래 정보를 저장할 딕셔너리
//    var genrePlayCount: [String: Int] = [:]
//    var genreSongs: [String: [(play: Int, index: Int)]] = [:]
//    
//    // 1. 각 노래의 장르, 재생 횟수, 인덱스 정보를 수집
//    for i in 0..<genres.count {
//        let genre = genres[i]
//        let play = plays[i]
//        
//        // 장르별 총 재생 횟수 업데이트
//        genrePlayCount[genre, default: 0] += play
//        
//        // 장르별 노래 정보 업데이트
//        if genreSongs[genre] == nil {
//            genreSongs[genre] = [(play, i)]
//        } else {
//            genreSongs[genre]!.append((play, i))
//        }
//    }
//    
//    // 2. 장르별로 노래를 재생 횟수 내림차순, 재생 횟수가 같으면 인덱스 오름차순으로 정렬
//    for genre in genreSongs.keys {
//        genreSongs[genre] = genreSongs[genre]!.sorted {
//            if $0.play == $1.play {
//                return $0.index < $1.index
//            }
//            return $0.play > $1.play
//        }
//    }
//    
//    // 3. 장르를 총 재생 횟수 기준으로 내림차순 정렬
//    let sortedGenres = genrePlayCount.sorted { $0.value > $1.value }
//    
//    // 4. 결과 배열 생성
//    var result: [Int] = []
//    
//    // 5. 각 장르에서 최대 2곡 선택
//    for (genre, _) in sortedGenres {
//        if let songs = genreSongs[genre] {
//            // 최대 2곡만 선택
//            let count = min(songs.count, 2)
//            for i in 0..<count {
//                result.append(songs[i].index)
//            }
//        }
//    }
//    
//    return result
//}
//
//// 테스트
//let genres = ["classic", "pop", "classic", "classic", "pop"]
//let plays = [500, 600, 150, 800, 2500]
//let result = bestAlbum(genres, plays)

func bestAlbum(_ genres: [String], _ plays: [Int]) -> [Int] {
  
    // 결과 배열 준비
    var answer: [Int] = []
    
    // 1. 장르별 총 재생 횟수를 저장하는 딕셔너리
    var genreTotalPlays: [String: Int] = [:]
    
    // 2. 장르별 노래 정보(인덱스, 재생 횟수)를 저장하는 딕셔너리
    var songsByGenre: [String: [(id: Int, play: Int)]] = [:]
    
    // 3. 데이터 수집 - 한 번의 반복으로 모든 정보 구성
    for i in 0..<genres.count {
        genreTotalPlays[genres[i], default: 0] += plays[i]
//        if songsByGenre[genres[i]] == nil {
//            songsByGenre[genres[i]] = [(id: i, play: plays[i])]
//        } else {
//            songsByGenre[genres[i]]?.append((id: i, play: plays[i]))
//        }
        songsByGenre[genres[i], default: []].append((id: i, plays[i]))
    }
    
    print(songsByGenre)
    
    
    // 4. 재생 횟수가 많은 장르부터 처리
    for (genre, _) in genreTotalPlays.sorted(by: { $0.value > $1.value }) {
        // 5. 해당 장르의 노래를 재생 횟수(내림차순) 및 인덱스(오름차순)로 정렬
        // genreTotalPlays의 값이 큰 순서대로 genre가 할당 된다.
//        let songsByGenreSorted = songsByGenre[genre]?.sorted(by: { $0.1 > $1.1 })
//        print(songsByGenreSorted)
        let songsSorted = songsByGenre[genre]!.sorted {
            if $0.play == $1.play {
                $0.id < $1.id
            } else {
                $0.play > $1.play
            }
        }
        // 6. 최대 2개의 노래 선택하여 결과에 추가
        // 최대 2개 노래의 id(Int) 만 추가하면 됨
//        if songsByGenreSorted!.count == 1 {
//            answer.append(songsByGenreSorted![0].0)
//        } else {
//            answer.append(songsByGenreSorted![0].0)
//            answer.append(songsByGenreSorted![1].0)
//        }
        for song in songsSorted.prefix(2) {
            answer.append(song.id)
        }
        
    }
    return answer
}



//func bestAlbum(_ genres: [String], _ plays: [Int]) -> [Int] {
//    
//    var answer: [Int] = []
//    var genreTotalPlays: [String: Int] = [:]
//    var songsByGenre: [String: [(id: Int, play: Int)]] = [:]
//    
//    for i in 0..<genres.count {
//        genreTotalPlays[genres[i], default: 0] += plays[i]
//        songsByGenre[genres[i], default: []].append((id: i, plays[i]))
//    }
//    
//    for (genre, _) in genreTotalPlays.sorted(by: { $0.value > $1.value }) {
//        let songsSorted = songsByGenre[genre]!.sorted {
//            if $0.play == $1.play {
//                $0.id < $1.id
//            } else {
//                $0.play > $1.play
//            }
//        }
//        for song in songsSorted.prefix(2) {
//            answer.append(song.id)
//        }
//    }
//    return answer
//}
