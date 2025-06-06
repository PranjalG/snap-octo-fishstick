class ApiResultData {
  int? numFound;
  int? start;
  bool? numFoundExact;
  List<Docs>? docs;

  ApiResultData({
    this.numFound,
    this.start,
    this.numFoundExact,
    this.docs,
  });

  ApiResultData.fromJson(Map<String, dynamic> json) {
    numFound = json['numFound'];
    start = json['start'];
    numFoundExact = json['numFoundExact'];
    if (json['docs'] != null) {
      docs = <Docs>[];
      json['docs'].forEach((v) {
        docs!.add(new Docs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['numFound'] = this.numFound;
    data['start'] = this.start;
    data['numFoundExact'] = this.numFoundExact;
    if (this.docs != null) {
      data['docs'] = this.docs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Docs {
  List<dynamic>? authorKey;
  List<dynamic>? authorName;
  String? title;
  // List<dynamic>? title;
  List<dynamic>? firstSentence;

  // List<String>? contributor;
  // String? coverEditionKey;
  // int? coverI;
  // String? ebookAccess;
  // int? ebookCountI;
  // int? editionCount;
  // List<String>? editionKey;
  // int? firstPublishYear;
  // bool? hasFulltext;
  // List<String>? ia;
  // List<String>? iaCollection;
  // String? iaCollectionS;
  // List<String>? isbn;
  // String? key;
  // List<String>? language;
  // int? lastModifiedI;
  // String? lendingEditionS;
  // String? lendingIdentifierS;
  // int? numberOfPagesMedian;
  // List<String>? oclc;
  // String? printdisabledS;
  // bool? publicScanB;
  // List<String>? publishDate;
  // List<String>? publishPlace;
  // List<int>? publishYear;
  // List<String>? publisher;
  // List<String>? seed;
  // String? titleSuggest;
  // String? titleSort;
  // String? type;
  // int? readinglogCount;
  // int? wantToReadCount;
  // int? currentlyReadingCount;
  // int? alreadyReadCount;
  // List<String>? publisherFacet;
  // int? iVersion;
  // List<String>? authorFacet;
  // List<String>? lcc;
  // List<String>? person;
  // List<String>? personKey;
  // List<String>? personFacet;
  // String? lccSort;
  // List<String>? lccn;
  // List<String>? idLibrarything;
  // List<String>? idGoodreads;
  // List<String>? subject;
  // List<String>? subjectFacet;
  // List<String>? subjectKey;
  // List<String>? format;
  // List<String>? authorAlternativeName;
  // String? subtitle;
  // int? ospCount;
  // List<String>? place;
  // List<String>? placeKey;
  // List<String>? placeFacet;
  // List<String>? ddc;
  // String? ddcSort;
  // List<String>? firstSentence;
  // List<String>? idAmazon;
  // List<String>? iaLoadedId;
  // List<String>? iaBoxId;
  // List<String>? time;
  // List<String>? timeFacet;
  // List<String>? timeKey;
  // List<String>? idWikidata;
  // int? ratingsAverage;
  // double? ratingsSortable;
  // int? ratingsCount;
  // int? ratingsCount1;
  // int? ratingsCount2;
  // int? ratingsCount3;
  // int? ratingsCount4;
  // int? ratingsCount5;
  // List<String>? idBetterWorldBooks;

  Docs({
    this.authorKey,
    this.authorName,
    // this.contributor,
    // this.coverEditionKey,
    // this.coverI,
    // this.ebookAccess,
    // this.ebookCountI,
    // this.editionCount,
    // this.editionKey,
    // this.firstPublishYear,
    // this.hasFulltext,
    // this.ia,
    // this.iaCollection,
    // this.iaCollectionS,
    // this.isbn,
    // this.key,
    // this.language,
    // this.lastModifiedI,
    // this.lendingEditionS,
    // this.lendingIdentifierS,
    // this.numberOfPagesMedian,
    // this.oclc,
    // this.printdisabledS,
    // this.publicScanB,
    // this.publishDate,
    // this.publishPlace,
    // this.publishYear,
    // this.publisher,
    // this.seed,
    this.title,
    // this.titleSuggest,
    // this.titleSort,
    // this.type,
    // this.readinglogCount,
    // this.wantToReadCount,
    // this.currentlyReadingCount,
    // this.alreadyReadCount,
    // this.publisherFacet,
    // this.iVersion,
    // this.authorFacet,
    // this.lcc,
    // this.person,
    // this.personKey,
    // this.personFacet,
    // this.lccSort,
    // this.lccn,
    // this.idLibrarything,
    // this.idGoodreads,
    // this.subject,
    // this.subjectFacet,
    // this.subjectKey,
    // this.format,
    // this.authorAlternativeName,
    // this.subtitle,
    // this.ospCount,
    // this.place,
    // this.placeKey,
    // this.placeFacet,
    // this.ddc,
    // this.ddcSort,
    this.firstSentence,
    // this.idAmazon,
    // this.iaLoadedId,
    // this.iaBoxId,
    // this.time,
    // this.timeFacet,
    // this.timeKey,
    // this.idWikidata,
    // this.ratingsAverage,
    // this.ratingsSortable,
    // this.ratingsCount,
    // this.ratingsCount1,
    // this.ratingsCount2,
    // this.ratingsCount3,
    // this.ratingsCount4,
    // this.ratingsCount5,
    // this.idBetterWorldBooks
  });

  Docs.fromJson(Map<String, dynamic> json) {
    authorKey = json['author_key'];
    authorName = json['author_name'];
    // contributor = json['contributor'].cast<String>();
    // coverEditionKey = json['cover_edition_key'];
    // coverI = json['cover_i'];
    // ebookAccess = json['ebook_access'];
    // ebookCountI = json['ebook_count_i'];
    // editionCount = json['edition_count'];
    // editionKey = json['edition_key'].cast<String>();
    // firstPublishYear = json['first_publish_year'];
    // hasFulltext = json['has_fulltext'];
    // ia = json['ia'].cast<String>();
    // iaCollection = json['ia_collection'].cast<String>();
    // iaCollectionS = json['ia_collection_s'];
    // isbn = json['isbn'].cast<String>();
    // key = json['key'];
    // language = json['language'].cast<String>();
    // lastModifiedI = json['last_modified_i'];
    // lendingEditionS = json['lending_edition_s'];
    // lendingIdentifierS = json['lending_identifier_s'];
    // numberOfPagesMedian = json['number_of_pages_median'];
    // oclc = json['oclc'].cast<String>();
    // printdisabledS = json['printdisabled_s'];
    // publicScanB = json['public_scan_b'];
    // publishDate = json['publish_date'].cast<String>();
    // publishPlace = json['publish_place'].cast<String>();
    // publishYear = json['publish_year'].cast<int>();
    // publisher = json['publisher'].cast<String>();
    // seed = json['seed'].cast<String>();
    title = json['title'];
    // titleSuggest = json['title_suggest'];
    // titleSort = json['title_sort'];
    // type = json['type'];
    // readinglogCount = json['readinglog_count'];
    // wantToReadCount = json['want_to_read_count'];
    // currentlyReadingCount = json['currently_reading_count'];
    // alreadyReadCount = json['already_read_count'];
    // publisherFacet = json['publisher_facet'].cast<String>();
    // iVersion = json['_version_'];
    // authorFacet = json['author_facet'].cast<String>();
    // lcc = json['lcc'].cast<String>();
    // person = json['person'].cast<String>();
    // personKey = json['person_key'].cast<String>();
    // personFacet = json['person_facet'].cast<String>();
    // lccSort = json['lcc_sort'];
    // lccn = json['lccn'].cast<String>();
    // idLibrarything = json['id_librarything'].cast<String>();
    // idGoodreads = json['id_goodreads'].cast<String>();
    // subject = json['subject'].cast<String>();
    // subjectFacet = json['subject_facet'].cast<String>();
    // subjectKey = json['subject_key'].cast<String>();
    // format = json['format'].cast<String>();
    // authorAlternativeName = json['author_alternative_name'].cast<String>();
    // subtitle = json['subtitle'];
    // ospCount = json['osp_count'];
    // place = json['place'].cast<String>();
    // placeKey = json['place_key'].cast<String>();
    // placeFacet = json['place_facet'].cast<String>();
    // ddc = json['ddc'].cast<String>();
    // ddcSort = json['ddc_sort'];
    firstSentence = json['first_sentence'];
    // idAmazon = json['id_amazon'].cast<String>();
    // iaLoadedId = json['ia_loaded_id'].cast<String>();
    // iaBoxId = json['ia_box_id'].cast<String>();
    // time = json['time'].cast<String>();
    // timeFacet = json['time_facet'].cast<String>();
    // timeKey = json['time_key'].cast<String>();
    // idWikidata = json['id_wikidata'].cast<String>();
    // ratingsAverage = json['ratings_average'];
    // ratingsSortable = json['ratings_sortable'];
    // ratingsCount = json['ratings_count'];
    // ratingsCount1 = json['ratings_count_1'];
    // ratingsCount2 = json['ratings_count_2'];
    // ratingsCount3 = json['ratings_count_3'];
    // ratingsCount4 = json['ratings_count_4'];
    // ratingsCount5 = json['ratings_count_5'];
    // idBetterWorldBooks = json['id_better_world_books'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['author_key'] = this.authorKey;
    data['author_name'] = this.authorName;
    // data['contributor'] = this.contributor;
    // data['cover_edition_key'] = this.coverEditionKey;
    // data['cover_i'] = this.coverI;
    // data['ebook_access'] = this.ebookAccess;
    // data['ebook_count_i'] = this.ebookCountI;
    // data['edition_count'] = this.editionCount;
    // data['edition_key'] = this.editionKey;
    // data['first_publish_year'] = this.firstPublishYear;
    // data['has_fulltext'] = this.hasFulltext;
    // data['ia'] = this.ia;
    // data['ia_collection'] = this.iaCollection;
    // data['ia_collection_s'] = this.iaCollectionS;
    // data['isbn'] = this.isbn;
    // data['key'] = this.key;
    // data['language'] = this.language;
    // data['last_modified_i'] = this.lastModifiedI;
    // data['lending_edition_s'] = this.lendingEditionS;
    // data['lending_identifier_s'] = this.lendingIdentifierS;
    // data['number_of_pages_median'] = this.numberOfPagesMedian;
    // data['oclc'] = this.oclc;
    // data['printdisabled_s'] = this.printdisabledS;
    // data['public_scan_b'] = this.publicScanB;
    // data['publish_date'] = this.publishDate;
    // data['publish_place'] = this.publishPlace;
    // data['publish_year'] = this.publishYear;
    // data['publisher'] = this.publisher;
    // data['seed'] = this.seed;
    data['title'] = this.title;
    // data['title_suggest'] = this.titleSuggest;
    // data['title_sort'] = this.titleSort;
    // data['type'] = this.type;
    // data['readinglog_count'] = this.readinglogCount;
    // data['want_to_read_count'] = this.wantToReadCount;
    // data['currently_reading_count'] = this.currentlyReadingCount;
    // data['already_read_count'] = this.alreadyReadCount;
    // data['publisher_facet'] = this.publisherFacet;
    // data['_version_'] = this.iVersion;
    // data['author_facet'] = this.authorFacet;
    // data['lcc'] = this.lcc;
    // data['person'] = this.person;
    // data['person_key'] = this.personKey;
    // data['person_facet'] = this.personFacet;
    // data['lcc_sort'] = this.lccSort;
    // data['lccn'] = this.lccn;
    // data['id_librarything'] = this.idLibrarything;
    // data['id_goodreads'] = this.idGoodreads;
    // data['subject'] = this.subject;
    // data['subject_facet'] = this.subjectFacet;
    // data['subject_key'] = this.subjectKey;
    // data['format'] = this.format;
    // data['author_alternative_name'] = this.authorAlternativeName;
    // data['subtitle'] = this.subtitle;
    // data['osp_count'] = this.ospCount;
    // data['place'] = this.place;
    // data['place_key'] = this.placeKey;
    // data['place_facet'] = this.placeFacet;
    // data['ddc'] = this.ddc;
    // data['ddc_sort'] = this.ddcSort;
    data['first_sentence'] = this.firstSentence;
    // data['id_amazon'] = this.idAmazon;
    // data['ia_loaded_id'] = this.iaLoadedId;
    // data['ia_box_id'] = this.iaBoxId;
    // data['time'] = this.time;
    // data['time_facet'] = this.timeFacet;
    // data['time_key'] = this.timeKey;
    // data['id_wikidata'] = this.idWikidata;
    // data['ratings_average'] = this.ratingsAverage;
    // data['ratings_sortable'] = this.ratingsSortable;
    // data['ratings_count'] = this.ratingsCount;
    // data['ratings_count_1'] = this.ratingsCount1;
    // data['ratings_count_2'] = this.ratingsCount2;
    // data['ratings_count_3'] = this.ratingsCount3;
    // data['ratings_count_4'] = this.ratingsCount4;
    // data['ratings_count_5'] = this.ratingsCount5;
    // data['id_better_world_books'] = this.idBetterWorldBooks;
    return data;
  }
}
