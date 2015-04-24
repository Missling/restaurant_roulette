$(document).ready(function() {
  $(document).on('click', '.add_favorite', function(event){
    event.preventDefault();

    var ajaxRequest = $.ajax({
      url: '/create_favorite',
      type: "POST",
      data_type: 'json',
      data: {
        name: $('.name').text(),
        yelp_url: $('.yelp_url').attr('href'),
        review_count: $('.review_count').text(),
        rating: $('.rating').text(),
        address: $('.address').text(),
        phone: $('.phone').text(),
        category: $('.category').text()
      }
    });
    
    ajaxRequest.done(function(response){
      $('.library').append(
          '<a class="list-group-item" target="_blank" href="' + response.yelp_url + '">' + response.name + '</a>'
        );
    }); 
  })

  $(document).on('click', '.favorite', function(event){
    event.preventDefault();

    var ajaxRequest = $.ajax({
      url: '/play_favorite',
      type: "GET",
      data_type: 'json'
    });

    ajaxRequest.done(function(response){
      $('#result > h3').html(response.name)
    });
  });
});

//data: $('.form').serialize() =if there is a form that get the info, but we are passing in the info ourselves