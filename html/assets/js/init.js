$(document).ready(function(){
  // LUA listener
  window.addEventListener('message', function( event ) {
    if (event.data.action == 'open') {
      var type        = event.data.type;
      var metaData    = event.data.metadata;
     
      var licenseData = event.data.metadata.licenses;
      var sex         = metaData.sex;
      var mugshot     = event.data.metadata.mugshoturl

      if ( type == 'driver' || type == null) {
        $('img').show();
        $('#name').css('color', '#282828');
        $('#fname').css('color', '#282828');

        if ( sex.toLowerCase() == 'm' ) {
          $('#sex').text('m');
        } else {
          $('#sex').text('f');
        }
        $('img').attr('src', mugshot);
        $('#idnum').text(metaData.citizenid);
        $('#expiry').text('01/01/2040');
        $('#name').text(metaData.lastName);
        $('#fname').text(metaData.firstName);
        $('#dob').text(metaData.dateofbirth);
        $('#height').text(metaData.height + 'cm');
        $('#signature').text(metaData.firstName + ' ' + metaData.lastName);

        if ( type == 'driver' ) {
          if ( licenseData != null ) {
          Object.keys(licenseData).forEach(function(key) {
            var type = licenseData[key].type;

            if ( type == 'drive_bike') {
              type = 'bike';
            } else if ( type == 'drive_truck' ) {
              type = 'truck';
            } else if ( type == 'drive' ) {
              type = 'car'; 
            }

            if ( type == 'bike' || type == 'truck' || type == 'car' ) {
              $('#licenses').append('<p>'+ type +'</p>');
            }
          });
        }

          $('#id-card').css('background', 'url(assets/images/license.png)');
        } else {
          $('#id-card').css('background', 'url(assets/images/idcard.png)');
        }
      } else if ( type == 'weapon' ) {
        $('img').hide();
        $('#name').css('color', '#d9d9d9');
        $('#fname').css('color', '#d9d9d9');
        $('#name').text(metaData.lastName);
        $('#fname').text(metaData.firstName);
        $('#dob').text(metaData.dateofbirth);
        $('#signature').text(metaData.firstName + ' ' + metaData.lastName);

        $('#id-card').css('background', 'url(assets/images/firearm.png)');
      }

      $('#id-card').show();
    } else if (event.data.action == 'close') {
      $('#name').text('');
      $('#fname').text('');
      $('#dob').text('');
      $('#height').text('');
      $('#signature').text('');
      $('#sex').text('');
      $('#id-card').hide();
      $('#licenses').html('');
    }
  });
});
