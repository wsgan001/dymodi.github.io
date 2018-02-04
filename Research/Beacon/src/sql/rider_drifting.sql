---- 骑手基于Beacon的定位和基于GPS的定位比较

---- 建临时表，
drop table if exists temp.temp_beacon_rider_all_pos;
create table temp.temp_beacon_rider_all_pos as
select t01.taker_id, t01.record_time, t01.latitude as gps_latitude, t01.longitude as gps_longitude,
parse_json_object(t01.detail, 'location_type') as location_type, t01.rn,
t02.detected_at as beacon_detected_at, t02.latitude as beacon_latitude, t02.longitude as beacon_longitude
from (
	select taker_id, record_time, latitude, longitude, detail,
	row_number() over (partition by taker_id order by record_time) as rn
	from dw.dw_log_talaris_taker_location_day_inc
	where dt = get_date(-1)
) t01
join(
	select rider_id, detected_at, latitude, longitude
	from dw_ai.dw_ai_clairvoyant_beacon
	where dt = get_date(-1) and rssi > -80
) t02
on t01.taker_id = t02.rider_id



	LAG (record_time, 1) OVER (PARTITION by target_id ORDER BY record_time) as last_record_time,
	LAG (latutude, 1) OVER (PARTITION by target_id ORDER BY record_time) as last_latitude,
	LAG (longitude, 1) OVER (PARTITION by target_id ORDER BY record_time) as last_longitude