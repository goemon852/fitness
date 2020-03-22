# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
BigGenre.create(big_genre: "筋肉をつける")
BigGenre.create(big_genre: "痩せたい")
BigGenre.create(big_genre: "食事面")
SmallGenre.create(small_genre: "腕", big_genre_id: 1)
SmallGenre.create(small_genre: "胸", big_genre_id: 1)
SmallGenre.create(small_genre: "お腹", big_genre_id: 1)
SmallGenre.create(small_genre: "背中", big_genre_id: 1)
SmallGenre.create(small_genre: "下半身", big_genre_id: 1)
SmallGenre.create(small_genre: "体幹", big_genre_id: 1)
SmallGenre.create(small_genre: "ランニング", big_genre_id: 2)
SmallGenre.create(small_genre: "ランニング以外", big_genre_id: 2)
SmallGenre.create(small_genre: "プロテイン", big_genre_id: 3)
SmallGenre.create(small_genre: "おすすめコンビニ飯", big_genre_id: 3)
SmallGenre.create(small_genre: "かんたん自炊", big_genre_id: 3)
SmallGenre.create(small_genre: "食べてはいけないもの", big_genre_id: 3)