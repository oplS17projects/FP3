#lang racket

(require binary-class/mp3)

(read-id3 "C:\\Users\\MayursMac\\Music\\My Music\\Bitter.mp3")
(read-id3 "C:\\Users\\MayursMac\\Music\\My Music\\Neverland (ft. Ruth B).mp3")

(define get-song-info '())

(set! get-song-info (cons (song (read-id3 "C:\\Users\\MayursMac\\Music\\My Music\\Bitter.mp3")) get-song-info))

(set! get-song-info (cons (artist (read-id3 "C:\\Users\\MayursMac\\Music\\My Music\\Bitter.mp3")) get-song-info))

(set! get-song-info (cons (song (read-id3 "C:\\Users\\MayursMac\\Music\\My Music\\Neverland (ft. Ruth B).mp3")) get-song-info))

(set! get-song-info (cons (artist (read-id3 "C:\\Users\\MayursMac\\Music\\My Music\\Neverland (ft. Ruth B).mp3")) get-song-info))


