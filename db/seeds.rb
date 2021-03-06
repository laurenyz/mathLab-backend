# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all
Reply.destroy_all
Tag.destroy_all
Upvote.destroy_all
Scratchpad.destroy_all
UserScratchpad.destroy_all

lauren = User.create(name: "Lauren Yu", username: "iLuvMath4eva", email: "lauren@yahoo.com", password: "s")
matteo = User.create(name: "Matteo R", username: "AmyAdamsAlways", email: "matteo@yahoo.com", password: "s")
bri = User.create(name: "Bri T", username: "dogsRmyLife", email: "bri@yahoo.com", password: "s")
chris = User.create(name: "Chris ZZZZZZ", username: "JazzDude", email: "chris@yahoo.com", password: "s")
alan = User.create(name: "Alan B", username: "gamer", email: "alan@yahoo.com", password: "s")
carl = User.create(name: "Carl Parmesan", username: "FloridaGuy", email: "carl@yahoo.com", password: "s")
jason = User.create(name: "Jason P", username: "JaSON()", email: "jason@yahoo.com", password: "s")
paul = User.create(name: "Paul K", username: "bumbot", email: "paul@yahoo.com", password: "s")
ryan = User.create(name: "Ryan", username: "RyRyRyan", email: "ryan@yahoo.com", password: "s")
valentin = User.create(name: "Valentin P", username: "Vale", email: "valentin@yahoo.com", password: "s")
wesley = User.create(name: "Wesley C", username: "Chefking", email: "wesley@yahoo.com", password: "s")
will = User.create(name: "William 'Will' Harris", username: "Will2", email: "will@yahoo.com", password: "s")
yo = User.create(name: "Yo P", username: "fro-YO", email: "yo@yahoo.com", password: "s")
audrey = User.create(name: "Audrey Y", username: "OBOEOBOEOBOE", email: "audrey@yahoo.com", password: "s")

lauren.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'lauren.jpeg')), filename: 'lauren.jpeg', content_type: 'image/png')
matteo.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'matteo.png')), filename: 'matteo.png', content_type: 'image/png')
bri.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'bri.png')), filename: 'bri.png', content_type: 'image/png')
carl.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'carl.jpeg')), filename: 'carl.jpeg', content_type: 'image/png')
jason.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'jason.png')), filename: 'jason.png', content_type: 'image/png')
paul.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'paul.jpeg')), filename: 'paul.jpeg', content_type: 'image/png')
ryan.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'ryan.jpeg')), filename: 'ryan.jpeg', content_type: 'image/png')
valentin.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'valentin.jpeg')), filename: 'valentin.jpeg', content_type: 'image/png')
wesley.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'wesley.png')), filename: 'wesley.png', content_type: 'image/png')
will.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'will.jpeg')), filename: 'will.jpeg', content_type: 'image/png')
yo.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'yo.jpeg')), filename: 'yo.jpeg', content_type: 'image/png')
alan.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'alan.jpeg')), filename: 'alan.jpeg', content_type: 'image/png')
chris.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'chris.jpg')), filename: 'chris.jpg', content_type: 'image/png')
audrey.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'audrey.jpeg')), filename: 'audrey.jpeg', content_type: 'image/png')

post2 = Post.create(user: lauren, post_text: "What is the Pythagorean Theorem?", subject: "Geometry")
post3 = Post.create(user: matteo, post_text: "How do you find the slope?", subject: "Algebra")
post5 = Post.create(user: bri, post_text: "I'm really interested in math history.  Can someone tell me more about Pythagoras?", subject: "Algebra")
post4 = Post.create(user: matteo, post_text: "I don't understand the circle equation", subject: "Pre-Calculus")
post6 = Post.create(user: bri, post_text: "What is a 30-60-90 triangle?", subject: "Geometry")
post8 = Post.create(user: chris, post_text: "How can I find the sine of an angle in a right triangle?", subject: "Trigonometry")
post9 = Post.create(user: audrey, post_text: "How do you do percents?", subject: "Pre-Algebra")
post7 = Post.create(user: chris, post_text: "Why is it called SOH CAH TOA?  I prefer TOA SOH CAH.", subject: "Trigonometry")
post10 = Post.create(user: audrey, post_text: "How are ratios different than fractions?", subject: "Pre-Algebra")
post1 = Post.create(user: lauren, post_text: "Who here likes math?", subject: "Algebra")

reply1 = Reply.create(replier: lauren, post: post9, reply_text: "I've always wondered that myself.")
reply2 = Reply.create(replier: lauren, post: post7, reply_text: "This question is dumb.")
reply3 = Reply.create(replier: matteo, post: post1, reply_text: "I like math, but chemical engineering is where it's at.")
reply4 = Reply.create(replier: matteo, post: post5, reply_text: "I'm more of a Euclid guy myself.")
reply5 = Reply.create(replier: bri, post: post1, reply_text: "Yeah, math's pretty cool.  Coding is way better, though.")
reply6 = Reply.create(replier: bri, post: post10, reply_text: "Ratios can compare part-to-part or part-to-whole while fractions only compare part-to-whole.")
reply7 = Reply.create(replier: bri, post: post4, reply_text: "It's (x-h)^2+(y-k)^2 = r^2 where (h,k) is the center of the circle and r is the radius.  It's confusing because the signs in the equation are actually opposite of the signs of the center point.")
reply8 = Reply.create(replier: chris, post: post8, reply_text: "Blerpblop.")
reply9 = Reply.create(replier: audrey, post: post1, reply_text: "Any other musicians here?")
reply10 = Reply.create(replier: audrey, post: post6, reply_text: "It's a special triangle that has very specific proportions: 1-rad(3)-2.  It would be helpful down the road if you memorize it!")

tag1 = Tag.create(post: post1, tagline: "#iluvmath")
tag2 = Tag.create(post: post2, tagline: "#help")
tag3 = Tag.create(post: post3, tagline: "#slopeformula")
tag4 = Tag.create(post: post4, tagline: "#circles")
tag5 = Tag.create(post: post5, tagline: "#mathhistory")
tag6 = Tag.create(post: post6, tagline: "#specialtriangles")
tag7 = Tag.create(post: post7, tagline: "#trigwordsareweird")
tag8 = Tag.create(post: post8, tagline: "#help")
tag9 = Tag.create(post: post9, tagline: "#percents")
tag10 = Tag.create(post: post1, tagline: "#community")
tag11 = Tag.create(post: post2, tagline: "#triangles")
tag12 = Tag.create(post: post1, tagline: "#showurspirit")
tag13 = Tag.create(post: post4, tagline: "#equations")
tag14 = Tag.create(post: post5, tagline: "#pythagoras4life")

Upvote.create(voter: lauren, reply: reply1)
Upvote.create(voter: lauren, reply: reply2)
Upvote.create(voter: lauren, reply: reply3)
Upvote.create(voter: lauren, reply: reply4)
Upvote.create(voter: lauren, reply: reply5)
Upvote.create(voter: lauren, reply: reply6)
Upvote.create(voter: lauren, reply: reply7)
Upvote.create(voter: lauren, reply: reply8)
Upvote.create(voter: lauren, reply: reply9)
Upvote.create(voter: lauren, reply: reply10)
Upvote.create(voter: matteo, reply: reply1)
Upvote.create(voter: matteo, reply: reply2)
Upvote.create(voter: matteo, reply: reply4)
Upvote.create(voter: matteo, reply: reply5)
Upvote.create(voter: matteo, reply: reply8)
Upvote.create(voter: matteo, reply: reply9)
Upvote.create(voter: bri, reply: reply1)
Upvote.create(voter: bri, reply: reply2)
Upvote.create(voter: bri, reply: reply3)
Upvote.create(voter: bri, reply: reply4)
Upvote.create(voter: bri, reply: reply5)
Upvote.create(voter: bri, reply: reply6)
Upvote.create(voter: bri, reply: reply7)
Upvote.create(voter: bri, reply: reply1)
Upvote.create(voter: bri, reply: reply10)
Upvote.create(voter: chris, reply: reply8)
Upvote.create(voter: audrey, reply: reply1)
Upvote.create(voter: audrey, reply: reply8)
Upvote.create(voter: audrey, reply: reply2)

first_scratchpad = Scratchpad.create(scratchpad_text: "Hello Other Browser, AKA HELLO WORLD", url: 1)

saved_scratchpad = UserScratchpad.create(user: lauren, scratchpad: first_scratchpad, name: "Saved Doc 1", url: 1)