# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do |i|
    Topic.create!(
        title: "Topic #{i}"
    )
end

10.times do |i|
    Blog.create!(
        title: "My blog post #{i}",
        body: "Lorem Ipsum is simply dummy 
            text of the printing and typesetting 
            industry. Lorem Ipsum has been the 
            industry's standard dummy text ever 
            since the 1500s, when an unknown printer 
            took a galley of type and scrambled it 
            to make a type specimen book. It has 
            survived not only five centuries, 
            but also the leap into electronic 
            typesetting, remaining essentially 
            unchanged.",
        topic_id: Topic.last.id
    )
end
puts "10 blog post created"

5.times do |skill|
    Skill.create!(
        title: "Rails #{skill}",
        percent_utilized: 15
    )
end
puts "5 skills created"

8.times do |porto|
    Portofolio.create!(
        title: "Portofolio title #{porto}",
        subtitle: "Rubt on Rails",
        body:"It is a long established fact that 
            a reader will be distracted by the 
            readable content of a page when looking 
            at its layout. ",
        main_image: "https://via.placeholder.com/600x400",
        thumb_image: "https://via.placeholder.com/350x200"
    )
end

1.times do |porto|
    Portofolio.create!(
        title: "Portofolio title #{porto}",
        subtitle: "Angular",
        body:"It is a long established fact that 
            a reader will be distracted by the 
            readable content of a page when looking 
            at its layout. ",
        main_image: "https://via.placeholder.com/600x400",
        thumb_image: "https://via.placeholder.com/350x200"
    )
end
puts "9 portofolio item created"

3.times do |tech|
    Portofolio.last.technologies.create!(
        name: "Tech #{tech}",
    )
end
puts "3 Technologies created"
