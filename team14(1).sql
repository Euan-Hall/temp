-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 17, 2023 at 01:34 PM
-- Server version: 5.5.68-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `team14`
--

-- --------------------------------------------------------

--
-- Table structure for table `forum`
--

CREATE TABLE `forum` (
  `postid` int(11) NOT NULL,
  `title` varchar(30) NOT NULL,
  `contents` text NOT NULL,
  `author_id` int(11) NOT NULL,
  `post_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `projects2`
--

CREATE TABLE `projects2` (
  `project_id` int(11) NOT NULL,
  `project_name` varchar(30) NOT NULL,
  `project_leader_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `projects2`
--

INSERT INTO `projects2` (`project_id`, `project_name`, `project_leader_id`) VALUES
(1, 'Project 1 - Testing', 15),
(2, 'Project 2 - Verification', 22),
(3, 'Project 3 - Something Else', 23),
(16, 'Project 4 - Create Test', 23);

-- --------------------------------------------------------

--
-- Table structure for table `project_employee`
--

CREATE TABLE `project_employee` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_employee`
--

INSERT INTO `project_employee` (`project_id`, `user_id`) VALUES
(1, 16),
(2, 17),
(2, 18),
(3, 19),
(3, 20),
(3, 21);

-- --------------------------------------------------------

--
-- Table structure for table `project_training`
--

CREATE TABLE `project_training` (
  `project_id` int(11) NOT NULL DEFAULT '0',
  `training_name` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `project_training`
--

INSERT INTO `project_training` (`project_id`, `training_name`) VALUES
(1, 'Testing Training'),
(2, 'Verification Training'),
(3, 'Some Training');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `task_id` int(11) NOT NULL,
  `task_content` text NOT NULL,
  `task_project_id` int(11) DEFAULT NULL,
  `task_assigned_user_id` int(11) DEFAULT NULL,
  `task_creator_id` int(11) NOT NULL,
  `task_editor_id` int(11) NOT NULL,
  `task_creation_date` date NOT NULL,
  `task_deadline_date` date NOT NULL,
  `task_hourneeded` int(11) NOT NULL,
  `task_status` enum('todo','doing','done') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`task_id`, `task_content`, `task_project_id`, `task_assigned_user_id`, `task_creator_id`, `task_editor_id`, `task_creation_date`, `task_deadline_date`, `task_hourneeded`, `task_status`) VALUES
(1, 'Task for Regular1', 1, 16, 2, 2, '2023-02-14', '2023-02-19', 3, 'todo'),
(4, 'Second Task for Regular1', 1, 16, 2, 2, '2023-02-14', '2023-02-18', 8, 'done'),
(5, 'This is a personal task!', NULL, 2, 2, 2, '2023-02-14', '2023-02-19', 3, 'doing'),
(7, 'Task 1 for Reg2', 2, 17, 2, 2, '2023-02-15', '2023-02-15', 5, 'todo'),
(8, 'Task 2 for Reg2', 2, 17, 2, 2, '2023-02-15', '2023-02-26', 3, 'todo'),
(9, 'Task 1 for Reg3', 2, 18, 2, 2, '2023-02-15', '2023-02-15', 1, 'todo'),
(10, 'Task 3 for REG2', 2, 17, 2, 2, '2023-02-15', '2023-02-15', 8, 'done'),
(11, 'e', NULL, 1, 1, 1, '2023-02-15', '2023-02-15', 5, 'todo');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(30) NOT NULL,
  `user_invite_code` varchar(6) DEFAULT NULL,
  `is_manager` enum('y','n') NOT NULL,
  `user_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_email`, `user_password`, `user_invite_code`, `is_manager`, `user_name`) VALUES
(1, 'test@make‐it‐all.co.uk', 'test', 'YVNX61', 'n', ''),
(2, 'manager@make‐it‐all.co.uk', 'test', 'GBC84D', 'y', ''),
(15, 'teamLeader1@make‐it‐all.co.uk', 'Password3', NULL, 'n', 'Tim'),
(16, 'regular1@make‐it‐all.co.uk', 'Password1', NULL, 'n', 'Kai'),
(17, 'regular2@make‐it‐all.co.uk', 'Password1', NULL, 'n', 'James'),
(18, 'regular3@make‐it‐all.co.uk', 'Password1', NULL, 'n', 'Havier'),
(19, 'regular4@make‐it‐all.co.uk', 'Password1', NULL, 'n', 'Polly'),
(20, 'regular5@make‐it‐all.co.uk', 'Password1', NULL, 'n', ''),
(21, 'regular6@make‐it‐all.co.uk', 'Password1', NULL, 'n', 'Remus'),
(22, 'teamLeader2@make‐it‐all.co.uk', 'Password1', NULL, 'n', 'Prince'),
(23, 'teamLeader3@make‐it‐all.co.uk', 'Password1', NULL, 'n', 'Alder'),
(34, 'NextTestName@make‐it‐all.co.uk', 'NextTest12', NULL, 'n', 'NextTestNa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `forum`
--
ALTER TABLE `forum`
  ADD PRIMARY KEY (`postid`),
  ADD KEY `author_id` (`author_id`);

--
-- Indexes for table `projects2`
--
ALTER TABLE `projects2`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `project_leader_id` (`project_leader_id`);

--
-- Indexes for table `project_employee`
--
ALTER TABLE `project_employee`
  ADD PRIMARY KEY (`project_id`,`user_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `project_training`
--
ALTER TABLE `project_training`
  ADD PRIMARY KEY (`project_id`,`training_name`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`task_id`),
  ADD KEY `task_project_id` (`task_project_id`),
  ADD KEY `task_assigned_user_id` (`task_assigned_user_id`),
  ADD KEY `task_creator_id` (`task_creator_id`),
  ADD KEY `task_editor_id` (`task_editor_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `forum`
--
ALTER TABLE `forum`
  MODIFY `postid` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects2`
--
ALTER TABLE `projects2`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `task_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `forum`
--
ALTER TABLE `forum`
  ADD CONSTRAINT `forum_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `projects2`
--
ALTER TABLE `projects2`
  ADD CONSTRAINT `projects2_ibfk_1` FOREIGN KEY (`project_leader_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `project_employee`
--
ALTER TABLE `project_employee`
  ADD CONSTRAINT `project_employee_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects2` (`project_id`),
  ADD CONSTRAINT `project_employee_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `project_training`
--
ALTER TABLE `project_training`
  ADD CONSTRAINT `project_training_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects2` (`project_id`);

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`task_project_id`) REFERENCES `projects2` (`project_id`),
  ADD CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`task_assigned_user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `tasks_ibfk_3` FOREIGN KEY (`task_creator_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `tasks_ibfk_4` FOREIGN KEY (`task_editor_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
