Book.delete_all
Author.delete_all
Role.delete_all
User.delete_all
Review.delete_all
Genre.delete_all

horror = Genre.create(name: "Horror", description: "Fiction in any medium intended to scare, unsettle, or horrify the audience.")
fantasy = Genre.create(name: "Fantasy", description: "Fantasy is a genre that uses magic and other supernatural forms as a primary element of plot, theme, and/or setting.")
apocalyptic = Genre.create(name: "Apocalyptic", description: "Apocalyptic fiction focuses on the end of civilization either through nuclear war, plague, or other global catastrophic risk.")
cs = Genre.create(name: "Computer Science", description: "Textbooks in computer science.")


carey = Author.create(name: "M.R. Carey")
stiefvater = Author.create(name: "Maggie Stiefvater")
acevedo = Author.create(name: "Kristy Acevedo")
c = Author.create(name: "Thomas H. Cormen")
l = Author.create(name: 'Charles E. Leiserson')
r = Author.create(name: 'Ronald L. Rivest')
s = Author.create(name: 'Clifford Stein')

fellside = Book.new
fellside.title = "Fellside"
fellside.description = "Fellside is a maximum security prison on the edge of the Yorkshire Moors. It's not the kind of place you'd want to end up. But it's where Jess Moulson could be spending the rest of her life."
fellside.year = 2016
fellside.genre_id = horror.id
fellside.save

raven_king = Book.new
raven_king.title = "The Raven King"
raven_king.description = 'For years, Gansey has been on a quest to find a lost king. One by one, he’s drawn others into this quest: Ronan, who steals from dreams; Adam, whose life is no longer his own; Noah, whose life is no longer a lie; and Blue, who loves Gansey…and is certain she is destined to kill him.'
raven_king.year = 2016
raven_king.genre_id = fantasy.id
raven_king.save

consider = Book.new
consider.title = "Consider"
consider.description = 'As if Alexandra Lucas’ anxiety disorder isn’t enough, mysterious holograms suddenly appear from the sky, heralding the end of the world. They bring an ultimatum: heed the warning and step through a portal-like vertex to safety, or stay and be destroyed by a comet they say is on a collision course with earth. How’s that for senior year stress?'
consider.year = 2016
consider.genre_id = apocalyptic.id
consider.save

algorithms = Book.new
algorithms.title = "Introduction to algorithms"
algorithms.description = 'This title covers a broad range of algorithms in depth, yet makes their design and analysis accessible to all levels of readers. Each chapter is relatively self-contained and can be used as a unit of study. The algorithms are described in English and in a pseudocode designed to be readable by anyone who has done a little programming.'
algorithms.year = 1989
algorithms.genre_id = cs.id
algorithms.save

Role.create(author_id: carey.id, book_id: fellside.id)
Role.create(author_id: stiefvater.id, book_id: raven_king.id)
Role.create(author_id: acevedo.id, book_id: consider.id)

Role.create(author_id: c.id, book_id: algorithms.id)
Role.create(author_id: l.id, book_id: algorithms.id)
Role.create(author_id: r.id, book_id: algorithms.id)
Role.create(author_id: s.id, book_id: algorithms.id)
