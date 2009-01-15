function is_search_request() {
    $r = $_SERVER['HTTP_REFERER'];
    $engines = array('/search?',
                'images.google.',
                'search.yahoo.com',
                'del.icio.us/search',
                'msn.com',
                'live.com',
                );
    foreach ($engine as $eng) {
        if (strpos($r,$eng) !== false)
             return true;
    }
    return false;
}
