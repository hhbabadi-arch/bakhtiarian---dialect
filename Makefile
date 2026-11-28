search-index: $(shell test -f data/lexicon-quinquelingual.json && echo data/lexicon-quinquelingual.json) \
              data/glossary.json data/folklore.json data/locations.json
	@mkdir -p dist/site
	node scripts/build-search-index.mjs
