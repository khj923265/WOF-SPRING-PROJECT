package org.wof.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@Data
@AllArgsConstructor
@Getter
public class ProjectReplyPageVO {
	private int replyCnt;
	private List<ProjectReplyVO> list;
}
