$(document).ready(function() {
  $(document).on('click', '.result', function(event){
    event.preventDefault();

    var ajaxRequest = $.ajax({
      url: '/create_favorite',
      type: "POST",
      content_type: 'json',
      data: {
        name: $('.name').text(),
        yelp_url: $('.yelp_url').text(),
        review_count: $('.review_count').text(),
        rating: $('.rating').text(),
        address: $('.address').text(),
        phone: $('.phone').text(),
        category: $('.category').text()
      }
    });
    
    ajaxRequest.done(function(response){
      $('.library').append(
          "<p>" + response.name + "</p>"
        );
    }); 
  })

  $(document).on('click', '.favorite', function(event){
    event.preventDefault();

    var ajaxRequest = $.ajax({
      url: '/play_favorite',
      type: "GET",
      content_type: 'json'
    });

    ajaxRequest.done(function(response){
      $('.result').html(response.name)
    });
  });  
});

//data: $('.form').serialize() =if there is a form that get the info, but we are passing in the info ourselves