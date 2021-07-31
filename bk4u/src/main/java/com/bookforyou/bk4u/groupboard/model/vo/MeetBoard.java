package com.bookforyou.bk4u.groupboard.model.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter @Setter
@ToString
public class MeetBoard {

	private int mBoardNo;
	private int groupBoardNo;
	private int memNo;
	private String mBoardContent;
	private Date mBoardCreateDate;
	private String mBoardStatus;
	private String groupLevel;
	private String upFileOrigin;
	private String upFileUrl;

	
}
