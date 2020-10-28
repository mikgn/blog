Задача: необходимо сделать простейший блог на Rails + PostgreSQL.

Описание:

К проекту необходимо прикрутить систему аутентификации. То есть, чтобы пользователь мог регистрироваться на проекте, логиниться и делать «выход из проекта». Можно использовать любое из понравившихся решений.

Сделать возможность создавать, просматривать, редактировать и удалять посты. Главная страница проекта должна представлять собой список всех постов, отсортированных по дате создания по убыванию, то есть самые свежие посты наверху. При редактировании имеется возможность изменить дату создания.

Сделать кеширование постов.

Делаем, чтобы посты мог создавать только зарегистрированный пользователь. Информацию об авторе поста следует добавить на главную страницу с постами. Необходимо настроить, чтобы редактирование и удаление постов делал только владелец этого поста. Добавить страницу “Мои посты” и разместить соответсвующую ссылку на главную страницу.

К постам необходимо прикрутить пагинатор. И настроить постраничный вывод постов на главной странице проекта (количество постов на одной странице установить равным 5)

Необходимо добавить возможность комментировать посты. Т.е. пользователи должны иметь возможность оставить комментарии к посту.

Настроить возможность редактирования/удаления своих комментариев. Комментарий можно удалить и редактировать только первые 15 минут после написания.

Пост может быть опубликованным или не опубликованным. Создаваемый пост сразу же публикуется. У пользователя есть возможность отменить автоматическую публикацию, установив соответсвующий флажок при создании. На главной выводим только опубликованные посты.

Теги. Сделать, чтобы на главной странице проекта строилось облако тегов, т.е. посты поддерживали возможность тегирования. При клике на определенном теге мы должны переходить на страницу со списком постов отвечающих данному тегу.

Тесты. Обеспечь тестовое покрытие проекта
