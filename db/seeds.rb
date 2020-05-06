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

lauren = User.create(name: "Lauren", username: "Lauren2", email: "laureky87@yahoo.com", password: "s")
matteo = User.create(name: "Matteo", username: "Matteo2", email: "matteo@yahoo.com", password: "s")
bri = User.create(name: "Bri", username: "Bri2", email: "bri@yahoo.com", password: "s")
chris = User.create(name: "Chris", username: "Chris", email: "chris@yahoo.com", password: "s")
audrey = User.create(name: "Audrey", username: "Audrey", email: "audrey@yahoo.com", password: "s")

lauren.default_image
matteo.default_image
bri.default_image
chris.default_image
audrey.default_image

post1 = Post.create(user: lauren, post_text: "Who here likes math?", subject: "Algebra")
post2 = Post.create(user: lauren, post_text: "What is the Pythagorean Theorem?", subject: "Geometry")
post3 = Post.create(user: matteo, post_text: "How do you find the slope?", subject: "Algebra")
post4 = Post.create(user: matteo, post_text: "I don't understand the circle equation", subject: "Pre-Calculus")    
post5 = Post.create(user: bri, post_text: "I'm really interested in math history.  Can someone tell me more about Pythagoras?", subject: "Algebra")
post6 = Post.create(user: bri, post_text: "What is a 30-60-90 triangle?", subject: "Geometry")
post7 = Post.create(user: chris, post_text: "Why is it called SOH CAH TOA?  I prefer TOA SOH CAH.", subject: "Trigonometry")
post8 = Post.create(user: chris, post_text: "How can I find the sine of an angle in a right triangle?", subject: "Trigonometry")
post9 = Post.create(user: audrey, post_text: "How do you do percents?", subject: "Pre-Algebra")
post10 = Post.create(user: audrey, post_text: "How are ratios different than fractions?", subject: "Pre-Algebra")

reply1 = Reply.create(replier: lauren, post: post9, reply_text: "I've always wondered that myself.")
reply2 = Reply.create(replier: lauren, post: post7, reply_text: "This question is dumb.")
reply3 = Reply.create(replier: matteo, post: post1, reply_text: "I like math, but mechanical engineering is where it's at.")
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