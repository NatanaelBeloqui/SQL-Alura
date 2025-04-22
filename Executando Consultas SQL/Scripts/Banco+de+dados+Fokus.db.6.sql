SELECT * from Treinamento
WHERE (curso LIKE 'O direito%' AND instituicao = 'da Rocha')
or (curso LIKE 'O conforto%' AND instituicao = 'das Neves');