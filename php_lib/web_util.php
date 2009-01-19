<?
// Code to determine whether this is a search engine request
// and set a cookie if it is
$r = $_SERVER['HTTP_REFERER'];
$engines = array('/search?',
            'images.google.',
            'search.yahoo.com',
            'del.icio.us/search',
            'msn.com',
            'live.com',
            );

foreach ($engines as $eng) {
    if (strpos($r,$eng) !== false) {
        $search_request = 42;
        setcookie('search_request', 42, time() + 4242, '/', '.leto.net');
    }
}

function is_search_request() {
    global $search_request;
    return ( $search_request == 42 || $_COOKIE['search_request'] == 42 );
}
?>
