package com.fmd.service.Impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.transaction.Transactional;
import org.springframework.stereotype.Service;
import com.fmd.dao.BaseDao;
import com.fmd.dao.LogDao;
import com.fmd.entity.Log;
import com.fmd.service.LogService;

@Service("logService")  
@Transactional  
public class LogServiceImpl extends BaseServiceImpl<Log> implements LogService {  
  
    /** 
     * 注入DAO 
     */  
    @Resource(name = "logDao")  
    public void setDao(BaseDao<Log> dao) {  
        super.setDao(dao);  
    }
    @Resource(name = "logDao")
    private LogDao logDao;
    /** 
     * 若CustomerService 定义了BaseService没有的方法，则可以在这里实现 
     */  
    @Override
	public void saveLog(String userid, String username, int type, String detail,String ip,String table,String operation) {
		Log log = new Log();
		log.setUser_id(userid);
		log.setUser_name(username);
		log.setType(type);
		log.setDetail(detail);
		log.setOperation_time(new Date());
		log.setState(1);
		log.setIp(ip);
		log.setTablename(table);
		log.setOperation(operation);
		logDao.save(log);
	}
	@Override
	public List<Log> queryLog(String userid,String startTime, String endTime, int pagesize, int from) {
		return logDao.queryLog(userid,startTime, endTime, pagesize, from);
	}
	@Override
	public int countLog(String userid,String startTime, String endTime) {
		return logDao.countLog(userid,startTime, endTime);
	} 
}  