package com.musclebeach.question.model;

import java.util.List;
import java.util.Set;



public interface QuestionDAO_interface {
	public void insert(QuestionVO questionVO);
    public void update(QuestionVO questionVO);
    public void delete(Integer questionID);
    public QuestionVO findByPrimaryKey(Integer questionID );
    
    public List<QuestionVO> getAll();
	public Set<QuestionVO> getQuestionByQuestionTitle(String questionTitle);
	public Set<QuestionVO> getQuestionByQuestionContent(String questionContent);
}
