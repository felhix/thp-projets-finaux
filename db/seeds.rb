# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u = User.create(email: "t@t.t", password: "foobar", password_confirmation: "foobar", first_name: "foo", last_name: "bar")
#deadline passée
DateValidation.create(project_lock: DateTime.new(2017, 8, 29, 22, 35, 0), session_name: "Session passee")
#deadline session janvier 2018
DateValidation.create(project_lock: DateTime.new(2018, 3, 1, 23, 59, 0), session_name: "Janvier 2018")

	Project.create([
			 title: 'Lorem ok dolor sit amet, consectetur cras amet.',
			 short_description: 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit...' ,
			 description: "
						# Sine dedisset viso eadem contendere nurusque

						## Petitur gravitate

						**Lorem markdownum texerat** fixis funus Ecce induitur, ipse, et nec onus!
						Adnuerat ducit est iuventa *sunt vulnera*, et inde nata murmure Clytien tollit.
						In est haurit, modo nox, miserarum scopulos poscat,
						[hunc](http://sacradocuique.net/ades) quam recisum, ama.

						## Nunc Neptune oris castra Eumenides dedistis curvataque

						Una datus potentia agitque adspexit media ergo vertunt reformatus Inachus et
						ingentia poscit habetque dicor, nec mutatas **vastat**. Vox medio possim,
						defendere Romanae: non quam utrumque, superest supplex fusus
						[ad](http://et.net/) iam, nox haut. Terrae habentem aliquis vagatur posse
						nebulas adamante ubi vincula victus: sanguis petit. Sinat alta arbore adiuro per
						canistris citharae summos. Suis **tardi accendit** presserat pubis ne venit et
						imbre minor Italicis undis, quo.

						- Aetatis ramis in pondus tuos aquae
						- Respiciens quas
						- Gratissima rami incubuit fidem

						## Parta hinc esset et scopulis dominatur servitura

						Aut exempla At vacat cornua miscet reserabo classe ara aut quosque vulgata.
						Interque porreximus misit, habent exul circumsonat occupat si erat liquefactis
						sume! Trahuntur versat. Hunc tua profanos, eminus sanguine aura sentiat remissis
						in auratum imber. Sed dedi licet ruent iustitia tamque fragor Hyrie, misit
						caput.

						## Falle decore fisso profundo

						Tristia matris nutu [causa vereri nymphae](http://www.iamet.net/). Bovis nega
						comitum *caelo ense* temptant germana liquebat pariter; est primi acerris
						vitiaverat erant, prohibentque damno vestigia. Pectore agentis myrteta tetigere
						fervebant tinxit accipe: nocet sola? Ille multicavo tu arbor gravidus genitor
						[placet ullus flava](http://vero.io/) at ullis Proximus quae, notavit tinxit.

						    maximizeLanguageDomain = voipTunnelingMount / 628381 +
						            keystroke_webmaster_vaporware - sequence;
						    dragArtificialArt = donationware;
						    if (tiger(dslamYottabyte(smartphone_num_webmail), signature_cd,
						            upGrayscale)) {
						        ibm += meta(4, programVleReal, udp);
						        tooltipClient = address_iscsi_ups.seo_pop_runtime(68, component);
						        mount_boot -= infotainment_boot;
						    } else {
						        permalink = card_multithreading_word;
						        mamp_ftp(repeaterMatrix / handleCopyToken, 5, url);
						    }

						Non dare miratur dare iusta densus et turpe, numina inspirat nimius Pelasgi
						quandoquidem, inaequalis quique. Ieiunia dixit telum amanti videtur ambae
						Tritonida, inde fortia, eadem. Deseruitque quorum: olim fallere, ardentem
						foribusque parte quatenus. [Licha](http://fertur.net/ignis.php) specularer suam,
						ferre stabat Mnemonides, eritque ripam, hausto astra, at tamen aliqua haerebat
						efflant comis.

				",
			 pitch: "
					# Sine dedisset viso eadem contendere nurusque

					## Petitur gravitate

					**Lorem markdownum texerat** fixis funus Ecce induitur, ipse, et nec onus!
					Adnuerat ducit est iuventa *sunt vulnera*, et inde nata murmure Clytien tollit.
					In est haurit, modo nox, miserarum scopulos poscat,
					[hunc](http://sacradocuique.net/ades) quam recisum, ama.

					## Nunc Neptune oris castra Eumenides dedistis curvataque

					Una datus potentia agitque adspexit media ergo vertunt reformatus Inachus et
					ingentia poscit habetque dicor, nec mutatas **vastat**. Vox medio possim,
					defendere Romanae: non quam utrumque, superest supplex fusus
					[ad](http://et.net/) iam, nox haut. Terrae habentem aliquis vagatur posse
					nebulas adamante ubi vincula victus: sanguis petit. Sinat alta arbore adiuro per
					canistris citharae summos. Suis **tardi accendit** presserat pubis ne venit et
					imbre minor Italicis undis, quo.

					- Aetatis ramis in pondus tuos aquae
					- Respiciens quas
					- Gratissima rami incubuit fidem

					## Parta hinc esset et scopulis dominatur servitura

					Aut exempla At vacat cornua miscet reserabo classe ara aut quosque vulgata.
					Interque porreximus misit, habent exul circumsonat occupat si erat liquefactis
					sume! Trahuntur versat. Hunc tua profanos, eminus sanguine aura sentiat remissis
					in auratum imber. Sed dedi licet ruent iustitia tamque fragor Hyrie, misit
					caput.

					## Falle decore fisso profundo

					Tristia matris nutu [causa vereri nymphae](http://www.iamet.net/). Bovis nega
					comitum *caelo ense* temptant germana liquebat pariter; est primi acerris
					vitiaverat erant, prohibentque damno vestigia. Pectore agentis myrteta tetigere
					fervebant tinxit accipe: nocet sola? Ille multicavo tu arbor gravidus genitor
					[placet ullus flava](http://vero.io/) at ullis Proximus quae, notavit tinxit.

					    maximizeLanguageDomain = voipTunnelingMount / 628381 +
					            keystroke_webmaster_vaporware - sequence;
					    dragArtificialArt = donationware;
					    if (tiger(dslamYottabyte(smartphone_num_webmail), signature_cd,
					            upGrayscale)) {
					        ibm += meta(4, programVleReal, udp);
					        tooltipClient = address_iscsi_ups.seo_pop_runtime(68, component);
					        mount_boot -= infotainment_boot;
					    } else {
					        permalink = card_multithreading_word;
					        mamp_ftp(repeaterMatrix / handleCopyToken, 5, url);
					    }

					Non dare miratur dare iusta densus et turpe, numina inspirat nimius Pelasgi
					quandoquidem, inaequalis quique. Ieiunia dixit telum amanti videtur ambae
					Tritonida, inde fortia, eadem. Deseruitque quorum: olim fallere, ardentem
					foribusque parte quatenus. [Licha](http://fertur.net/ignis.php) specularer suam,
					ferre stabat Mnemonides, eritque ripam, hausto astra, at tamen aliqua haerebat
					efflant comis.

					",
			 user_id: 1
			])
