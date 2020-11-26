package org.wof.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;

@AllArgsConstructor
@Data
@Getter
public class CommunityReplyPageDTO {
	private int replyCnt;
	private List<CommunityReplyVO> list;
}
