package com.aonproject.admin.category.dao;

import java.util.List;

import com.aonproject.admin.category.vo.CategoryVO;

public interface CategoryDAO {
	//카테고리관리
	public List<CategoryVO> categoryList(CategoryVO cvo);
	
//	public CategoryVO categorySelect(CategoryVO cvo);
	public int categoryInsert(CategoryVO cvo);
	
}
