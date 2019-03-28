package com.cuilihuan.handle;

import com.cuilihuan.beans.Department;
import com.cuilihuan.beans.Employee;
import com.cuilihuan.dao.DepartmentDao;
import com.cuilihuan.dao.EmployeeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * @Auther:Cui LiHuan
 * @Date: 2019/3/18 21:59
 * @Description:
 */

@Controller
public class RestCrudHandler {


    @Autowired
    private EmployeeDao employeeDao;

    @Autowired
    private DepartmentDao departmentDao;
    /**
     * 显示所有员工信息列表
     */
    @RequestMapping(value = "/emps",method = RequestMethod.GET)
    public String listAllEmps(Map<String,Object> map, HttpServletRequest request) {

        Collection<Employee> employeeDaoAll = employeeDao.getAll();
        System.out.println(employeeDaoAll);
        map.put("emps", employeeDaoAll);
        return "list";
    }

    /**
     * 添加功能：去往添加页面
     * 添加页面需要部门数据
     */
    @RequestMapping(value = "/emp",method = RequestMethod.GET)
    public String toAddage(Map<String,Object> map) {
        Collection<Department> departments = departmentDao.getDepartments();
        map.put("depts", departments);

//        2.构造页面中生成表单的数据
        Map<String, String> genders = new HashMap<>();
        genders.put("0", "女");
        genders.put("1", "男");
        map.put("genders", genders);

        //设置页面中回显的数据
        map.put("command", new Employee());

        return "put";
    }

    /**
     * 添加功能：具体的添加操作
     */
    @RequestMapping(value = "emp",method = RequestMethod.POST)
    public String addEmp(Employee employee) {
        employeeDao.save(employee);
        //回到列表页面，重定向到显示所有员工列表的请求
        return "redirect:/emps";
    }

    @RequestMapping(value = "/emp/{id}", method = RequestMethod.DELETE)
    public String deleteEmp(@PathVariable("id")Integer id) {
        employeeDao.delete(id);
        return "redirect:/emps";

    }

    /**
     * 修改功能
     */
    @RequestMapping(value = "/emp/{id}",method = RequestMethod.GET)
    public String toUpdatePage(@PathVariable("id")Integer id,Map<String,Object> map) {
        Employee employee = employeeDao.get(id);
        map.put("employee", employee);

        Collection<Department> departments = departmentDao.getDepartments();
        map.put("depts", departments);

        Map<String, String> genders = new HashMap<>();
        genders.put("0", "女");
        genders.put("1", "男");
        map.put("genders", genders);
        return "put";

    }
}
