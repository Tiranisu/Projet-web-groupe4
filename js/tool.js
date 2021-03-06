/**
 * Main ajax request
 */
export function ajaxRequest(type, url, callback, data = null){
  let xhr;

  // Create XML HTTP request.
  xhr = new XMLHttpRequest();
  if (type == 'GET' && data != null)
    url += '?' + data;
  xhr.open(type, url);
  xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

  // Add the onload function.
  xhr.onload = () =>
  {
    switch (xhr.status)
    {
      case 200:
      case 201:
        // console.log(xhr.responseText);
        callback(JSON.parse(xhr.responseText));
        break;
      default:
        httpErrors(xhr.status);
    }
  };

  // Send XML HTTP request.
  xhr.send(data);
}


/**
 * Return the access token 
 * 
 * @param c_name cookie name 
 * @returns the access token of the user
 */
export function getCookie(c_name) {
	let c_start
	let c_end
	if (document.cookie.length > 0) {
		c_start = document.cookie.indexOf(c_name + "=");
		if (c_start != -1) {
			c_start = c_start + c_name.length + 1;
			c_end = document.cookie.indexOf(";", c_start);
			if (c_end == -1) {
				c_end = document.cookie.length;
			}
			return unescape(document.cookie.substring(c_start, c_end));
		}
	}
	return "";
}


/**
 * Delete the cookie 
 * 
 * @param name name of the cookie (here sportisen) 
 */
export function deleteCookie(name){
    document.cookie = name + "=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC"
}


export function disconnect(){
    deleteCookie('sportisen')
    let url = window.location.href.replace(/search\.html.*/i, '../index.html')
    window.location.href = url
}


/**
 * Print dynamicly the title and the favicon
 * the dynamic icon is from : 
 * https://stackoverflow.com/questions/260857/changing-website-favicon-dynamically
 * 
 * @param infos user information
 */
export function dynPage(infos){
    var link = document.querySelector("link[rel~='icon']");
    if (!link) {
        link = document.createElement('link');
        link.rel = 'icon';
        document.getElementsByTagName('head')[0].appendChild(link);
    }
  
    document.title = infos[0]['firstname'] + " " + infos[0]['lastname']
    if(infos[0]['link_image'] == null){
      link.href = "../resources/img_profil/default_user.png"
    }
    else{
      link.href = "../resources/img_profil/" + infos[0]['link_image']
    }
}


/**
 * Print the profil picture of the user in the navbar
 * 
 * @param infos 
 */
export function displayImage(infos){
    if(infos[0]['link_image'] == null){
        document.getElementById("profilePicture").src="../resources/img_profil/default_user.png"
    }
    else{
        document.getElementById("profilePicture").src= "../resources/img_profil/" + infos[0]['link_image']
    }
}