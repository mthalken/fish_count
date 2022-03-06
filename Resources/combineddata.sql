INSERT INTO combineddata
(
select
	dv.dateid,
	dv.yearvalue,
	dv.monthvalue,
	dv.weeknumber,
	'Bonneville' as locationname,
	dv.datevalue,
	bw.maxtempf,
	bw.mintempf,
	bw.precipitationinch,
	bf.watertempf,
	bf.stlheadcount/*,
	bf.chinookcount,
	bf.sockeyecount,
	bf.cohocount,
	bf.chadcount*/
from datevalues dv
	left join
		bonfishcounts bf
		on dv.dateid = bf.countid
	left join
		bonweather bw
		on dv.dateid = bw.countid
);

INSERT INTO combineddata2
(
select
	dv.dateid,
	dv.yearvalue,
	dv.monthvalue,
	dv.weeknumber,
	'Bonneville' as locationname,
	dv.datevalue,
	bw.maxtempf,
	bw.mintempf,
	bw.precipitationinch,
	bf.watertempf,
	bf.stlheadcount,
	bf.chinookcount,
	bf.sockeyecount,
	bf.cohocount,
	bf.chadcount
from datevalues dv
	left join
		bonfishcounts bf
		on dv.dateid = bf.countid
	left join
		bonweather bw
		on dv.dateid = bw.countid
);
	