# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Photo.create!(
  photo_date: '2021-4-14',
  content_type: 'image',
  uploader_id: 1,
  image: File.open("./public/images/sample1.jpg")
)

Photo.create!(
  photo_date: '2021-5-14',
  content_type: 'image',
  uploader_id: 1,
  image: File.open("./public/images/sample2.jpg")
)

Photo.create!(
  photo_date: '2021-4-14',
  content_type: 'image',
  uploader_id: 1,
  image: File.open("./public/images/sample3.jpg")
)

Photo.create!(
  photo_date: '2021-5-14',
  content_type: 'image',
  uploader_id: 1,
  image: File.open("./public/images/sample4.jpg")
)

Photo.create!(
  photo_date: '2021-6-14',
  content_type: 'image',
  uploader_id: 1,
  image: File.open("./public/images/sample5.jpg")
)