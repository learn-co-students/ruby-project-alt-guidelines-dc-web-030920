Album.destroy_all
Song.destroy_all
Artist.destroy_all

album1 = Album.create(title: "Rhodeo", release_date: "03/20/13")
album2 = Album.create(title: "21", release_date: "04/20/08")
album3 = Album.create(title: "Eternal Atake", release_date: "03/14/20")
album4 = Album.create(title: "Glory", release_date: "06/12/2016")
album5 = Album.create(title: "Thriller", release_date: "03/23/1982")
album6 = Album.create(title: "Bad", release_date: "11/23/1987")
album7 = Album.create(title: "A Night Tuscany", release_date: "12/14/1997")

artist1 = Artist.create(name: "Lil Uzi", genre: "Rap")
artist2 = Artist.create(name: "Adele", genre: "Pop")
artist3 = Artist.create(name: "Travis Scott", genre: "Rap")
artist4 = Artist.create(name: "Michael Jackson", genre: "Pop")
artist5 = Artist.create(name: "Britney Spears", genre: "Pop")
artist6 = Artist.create(name: "Andrea Bocelli", genre: "Opera")


song1 = Song.create(name: "Goosebumps", artist_id: artist3.id, album_id: album1.id)
song2 = Song.create(name: "Hello", artist_id: artist2.id, album_id: album2.id)
song3 = Song.create(name: "Kobe", artist_id: artist1.id, album_id: album3.id)
song4 = Song.create(name: "Beat It", artist_id: artist4.id , album_id: album5.id)
song5 = Song.create(name: "Bad", artist_id: artist4.id, album_id: album6.id)
song6 = Song.create(name: "Invitation", artist_id: artist5.id, album_id: album4.id)
song7 = Song.create(name: "Make Me", artist_id: artist5.id, album_id: album4.id)
song8 = Song.create(name: "Rolling In The Deep", artist_id: artist2.id, album_id: album2.id)
song9 = Song.create(name: "Time To Say Goodbye", artist_id: artist6.id, album_id: album7.id)

