// export function getCookie(name){
//     return document.cookie
// }

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


export function deleteCookie(name){
    document.cookie = name + "=; path=/; expires=Thu, 01 Jan 1970 00:00:00 UTC"
}
