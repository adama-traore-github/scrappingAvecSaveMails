Ce projet en Ruby permet de scraper les noms de villes et les adresses e-mail à partir de pages web de mairies et de les enregistrer dans des fichiers JSON et CSV. Pour l'utiliser, clonez le repository, installez les dépendances avec bundle install, puis exécutez ruby scrap_mairie.rb. Assurez-vous que le dossier db existe, sinon le script vous demandera de le créer avant de poursuivre. Le script utilise les gemmes nokogiri pour le parsing HTML, fileutils pour la gestion des fichiers, et csv pour l'écriture des données au format CSV. Les données récupérées seront stockées dans les fichiers emails.json et emails.csv dans le dossier db.