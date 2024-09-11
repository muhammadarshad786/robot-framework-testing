import http from 'k6/http';
import { sleep } from 'k6';

export let options ={
    insecureSkipTLsVerify: true,
    noConnectionReuse : true,
    vus:5,
    duration :'1s'


}

export default function() {
    http.get('https://demo.nopcommerce.com'); 
    sleep(2);  
}