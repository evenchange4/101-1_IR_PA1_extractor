load 'load/Extractor.rb'

#open Text collection
a= open('../input/1.txt', "rb").read

#new object Extractor
extractor = Extractor.new  

extractor.extract(a, 'result')

