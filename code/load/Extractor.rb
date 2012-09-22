#IR PA1 MichaelHsu
#2012.09.18

#class : Extractor
#method: extract input string, output a text file

#https://github.com/raypereda/stemmify
require 'stemmify'

class Extractor
	def extract(collectionDocument, outputFileName)
		#use download stop_words @ http://ir.dcs.gla.ac.uk/resources/linguistic_utils/stop_words
		stopwords = open('load/stop_words.txt', "rb").read
		#output result array
		result = Array.new
		#Lowercasing everything.
		b = collectionDocument.downcase
		#Tokenization. char in a array []
		puts c = b.tr(',', '') .split(/[?."\\\s]/)
		#Stemming using Porter’s algorithm
		c.each do |term|
			#Stopword removal.
			if !stopwords.include?term
				result << term.stem
			end
		end

		#Save the result as a txt file.
		f = File.open("../output/"+outputFileName+".txt", 'w')
		f.write(result)
		f.close()

	end
end