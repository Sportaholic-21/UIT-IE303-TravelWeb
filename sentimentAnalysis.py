from nltk.sentiment.vader import SentimentIntensityAnalyzer
import nltk
import sys

inp = sys.argv[1];
sid= SentimentIntensityAnalyzer()
score = sid.polarity_scores(inp)

if score["neg"] != 0:
    print(0)
else:
    print(1)