require_relative 'lib/app/scrap_mairie'
require 'json'
require 'csv'
require 'fileutils'

# Fonction pour enregistrer les données dans un fichier JSON
def save_to_json(data, filename)
  # Assurez-vous que le dossier 'db' existe
  FileUtils.mkdir_p('db')

  # Chemin complet du fichier JSON
  file_path = File.join('db', filename)

  File.open(file_path, 'w') do |file|
    file.write(JSON.pretty_generate(data))
  end
end

# Fonction pour enregistrer les emails dans un fichier CSV
def save_to_csv(data, filename)
  # Chemin complet du fichier CSV
  file_path = File.join('db', filename)

  CSV.open(file_path, 'w', col_sep: ',', force_quotes: true) do |csv|
    csv << ['Ville', 'Email'] # Écriture de l'en-tête
    data.each do |entry|
      csv << [entry[:ville], entry[:email]]
    end
  end
end

# Vérifiez que le dossier 'db' existe
unless Dir.exist?('db')
  puts "Le dossier 'db' n'existe pas. Veuillez le créer avant d'exécuter le script."
  exit
end

# URL de la page à scraper
url = "https://www.annuaire-mairie.fr/ville-argenteuil.html"

# Scraping des données
mairie_data = scrap_mairie_ville(url)

# Enregistrement des données dans un fichier JSON dans le dossier 'db'
save_to_json([mairie_data], 'emails.json')

# Enregistrement des emails dans un fichier CSV dans le dossier 'db'
save_to_csv([mairie_data], 'emails.csv')

puts "Les données ont été enregistrées dans les fichiers db/emails.json et db/emails.csv"
