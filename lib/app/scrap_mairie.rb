

require 'nokogiri'
require 'open-uri'

# Fonction pour scraper les données d'une mairie
def scrap_mairie_ville(url)
  html = URI.open(url)
  doc = Nokogiri::HTML(html)

  mairie_ville = doc.xpath('//*[@id="mairie"]').text.strip

  # Sélection de l'e-mail dans un lien mailto
  mairie_email = doc.xpath('//*[@id="content"]/div[2]/p[8]/a').text.strip

  mairie_hash = { ville: mairie_ville, email: mairie_email }
end
