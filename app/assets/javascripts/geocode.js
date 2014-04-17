function codeAddress() {
    geocoder = new google.maps.Geocoder();
    geocoder.geocode( { 'address': $('#address').val() }, function(results, status) {
        $('#address').val(results[0].formatted_address);
        if (status == google.maps.GeocoderStatus.OK) {
            $('#latitude').val(results[0].geometry.location.A);
            $('#longitude').val(results[0].geometry.location.k);
        }
        else {
            console.log("Geocode was not successful for the following reason: " + status);
        }
    });
}