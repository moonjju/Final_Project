package com.simpson.kisen.product.model.vo;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@NoArgsConstructor
public class ProductOption extends Product{
	private int optionNo;
	private String pdNo;
	private String optionName;
}
