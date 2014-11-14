# i know this should be dynamic, will do this later. tired now.

namespace :db do
	desc "populates the database with blog posts"

	task :populate_blog, [:amount, :delete] => :environment do |t, args|
		args.with_defaults(delete: 'true')
		delete = args[:delete] == 'true'
		amount = args[:amount].to_i
		puts "--------------"
		puts "Creating Blog posts"
		puts "--------------"

		enermis = User.find_by username: "Enermis"
		peanut = User.find_by username: "peanut"

		BlogComment.delete_all
		BlogPost.delete_all

		bp1 = BlogPost.create!(
				title: "Muizen in de PC's?",
				content: "Er zijn vandaag vanuit verschillende hoeken claims gekomen dat er muizen in de PC's zitten. deadmau5 is reeds gecontacteerd voor professioneel advies.",
				user: peanut
		)
		BlogComment.create!(
				content: "Ahja, die muizen! Ik heb er ook een in mijn PC gevonden. Dringend hulp gevraagd. Muizenstront vult nu reeds 10% van de PC.",
				user: enermis,
				blog_post: bp1
		)
		BlogComment.create!(
				content: "Muizenstrontniveau benadert de 40% nu. GPU temperatuur hoger dan normaal. Gelieve zo snel mogelijk een oplossing te bieden.",
				user: enermis,
				blog_post: bp1
		)
		BlogPost.create!(
				title: "Geen elektriciteitsuitval dit jaar",
				content: "Dit jaar is er tegen alle verwachting in geen uitval van de elektriciteit geweest. Onze plaatselijke specialist heeft vastgesteld dat de computers inderdaad aangesloten zijn op de extra elektriciteitskast, en niet op het lokale lichtnet.",
				user: enermis
		)
		bp2 = BlogPost.create!(
				title: "LoL minst populaire spel",
				content: "League of Legends, dat origineel voorzien was als het spel met de belangrijkste compo, is compleet uit de smaak gevallen. De compo had een karige opkomst van 4 mensen, en bijgevolg werd dus een 2v2 ARAM wedstrijd georganiseerd.",
				user: enermis
		)
		BlogComment.create!(
				content: "Ik wist wel da'k ging winne!",
				user: peanut,
				blog_post: bp2
		)
		bp2.save!
	end
end
