package com.controller;

import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;

import com.entity.JianshenfangxinxiEntity;

import com.service.JianshenfangxinxiService;
import com.utils.PageUtils;
import com.utils.R;

/**
 * 
 * 后端接口
 * @author
 * @email
 * @date 2021-01-26
*/
@RestController
@Controller
@RequestMapping("/jianshenfangxinxi")
public class JianshenfangxinxiController {
    private static final Logger logger = LoggerFactory.getLogger(JianshenfangxinxiController.class);

    @Autowired
    private JianshenfangxinxiService jianshenfangxinxiService;

    /**
    * 后端列表
    */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params){
        logger.debug("Controller:"+this.getClass().getName()+",page方法");
        PageUtils page = jianshenfangxinxiService.queryPage(params);
        return R.ok().put("data", page);
    }
    /**
    * 后端详情
    */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        logger.debug("Controller:"+this.getClass().getName()+",info方法");
        JianshenfangxinxiEntity jianshenfangxinxi = jianshenfangxinxiService.selectById(id);
        if(jianshenfangxinxi!=null){
            return R.ok().put("data", jianshenfangxinxi);
        }else {
            return R.error(511,"查不到数据");
        }

    }

    /**
    * 后端保存
    */
    @RequestMapping("/save")
    public R save(@RequestBody JianshenfangxinxiEntity jianshenfangxinxi, HttpServletRequest request){
        logger.debug("Controller:"+this.getClass().getName()+",save");
        Wrapper<JianshenfangxinxiEntity> queryWrapper = new EntityWrapper<JianshenfangxinxiEntity>()
            .eq("jsfname", jianshenfangxinxi.getJsfname());
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        JianshenfangxinxiEntity jianshenfangxinxiEntity = jianshenfangxinxiService.selectOne(queryWrapper);
        if(jianshenfangxinxiEntity==null){
            jianshenfangxinxi.setId((int) (new Date().getTime()+new Double(Math.floor(Math.random()*1000)).longValue()));
            jianshenfangxinxiService.insert(jianshenfangxinxi);
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }

    /**
    * 修改
    */
    @RequestMapping("/update")
    public R update(@RequestBody JianshenfangxinxiEntity jianshenfangxinxi, HttpServletRequest request){
        logger.debug("Controller:"+this.getClass().getName()+",update");
        //根据字段查询是否有相同数据
        Wrapper<JianshenfangxinxiEntity> queryWrapper = new EntityWrapper<JianshenfangxinxiEntity>()
            .notIn("id",jianshenfangxinxi.getId())
            .eq("jsfname", jianshenfangxinxi.getJsfname());
        logger.info("sql语句:"+queryWrapper.getSqlSegment());
        JianshenfangxinxiEntity jianshenfangxinxiEntity = jianshenfangxinxiService.selectOne(queryWrapper);
        if(jianshenfangxinxiEntity==null){
            jianshenfangxinxiService.updateById(jianshenfangxinxi);//根据id更新
            return R.ok();
        }else {
            return R.error(511,"表中有相同数据");
        }
    }


    /**
    * 删除
    */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        logger.debug("Controller:"+this.getClass().getName()+",delete");
        jianshenfangxinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
}

